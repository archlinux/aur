pkgname=haraka
pkgver=2.8.28
pkgrel=1
pkgdesc='A fast, highly extensible, and event driven SMTP server'
arch=(x86_64 aarch64)
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


sha256sums=('63b2016f16bf4c546b64a14e3124fe89f9f5abf71da7fbf3008e81afd65f5dcb'
            '12fbaf9d83d54763bd5f5b0ea37906b148f5dcb85c39d4035bec41f589019bcd')
