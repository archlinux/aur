# Submitter:   Victor Dyotte <vdyotte@gmail.com>
# Maintainer:  Victor Dyotte <vdyotte@gmail.com>

pkgname=foyer
pkgver=v0.1
pkgrel=3
pkgdesc="Self contained modular start page webserver."
arch=('i686' 'x86_64')
url="https://github.com/Kiniamaro/Foyer"
license=('AGPL')
groups=()

makedepends=('tar')
source=(https://github.com/Kiniamaro/Foyer/releases/download/$pkgver/$pkgname-unix-$pkgver.tgz)
md5sums=('cb59585a2eed28095c1924559b3dce8b')

package() {
	install -dm755 "$pkgdir/usr/share/$pkgname"
	cp -r $srcdir/$pkgname/* "$pkgdir/usr/share/$pkgname/"
}

post_install() {
	ln -s "/usr/share/$pkgname/foyer" "/usr/bin/$pkgname"
}
