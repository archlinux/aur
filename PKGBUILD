pkgname=haraka
pkgver=2.8.27
pkgrel=1
pkgdesc='A fast, highly extensible, and event driven SMTP server'
arch=(i686 x86_64 aarch64)
url=http://haraka.github.io/
license=(MIT)
depends=(nodejs)
makedepends=(npm python2)
options=(!strip)
source=(https://github.com/haraka/Haraka/archive/refs/tags/$pkgver.tar.gz
        haraka.service)
install=haraka.install

package() {
    cd $srcdir/Haraka-$pkgver    

    npm install -g --prefix="$pkgdir"/usr Haraka@$pkgver
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    install -Dm700 $srcdir/haraka.service $pkgdir/usr/lib/systemd/system/haraka.service
    install -d $pkgdir/etc/haraka
}


sha256sums=('3c8902abf5d44aa066f45c7ca0f7d4c096648f4ae05558cb0e58c6a9d6cdfbdd'
            'd2007c388d622b26db3a21b210641a863ec274a8e353a5131ac1b5e6cc0cfa25')
