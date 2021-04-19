# Maintainer: Aeryxium <aeryxium+aur@gmail.com>
pkgname='tgr'
pkgver=1
pkgrel=2
pkgdesc='Refresh gpg keys periodically and privately over tor circuits.'
arch=('any')
url='https://github.com/aeryxium/tgr'
license=('MIT')
source=("tgr" "tgr.service" "LICENSE" )
sha256sums=('9cb464745642b9285ea0e83b77d210fa9755c0edbe6f64f94f83107413332811'
            'd1b8c8762a0d6ed2d4e5061749e0ede488460bb4123d1f1be5da3840ee8f1866'
            '80665554a4613fa092262f935404215f29816b5d42ea0dc75d12c9d6d1d03659')
depends=( 'tor' 'torsocks' )
package() {
	install -Dm0755 "$srcdir/tgr" "$pkgdir/usr/bin/tgr"
	install -Dm0644 "$srcdir/tgr.service" "$pkgdir/usr/lib/systemd/user/tgr.service"
	install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
