pkgname=haraka
pkgver=3.0.2
pkgrel=1
pkgdesc='A fast, highly extensible, and event driven SMTP server'
arch=(x86_64 aarch64)
url=http://haraka.github.io/
license=(MIT)
depends=(nodejs)
makedepends=(npm)
options=(!strip)
source=(https://github.com/haraka/Haraka/archive/refs/tags/v$pkgver.tar.gz
        haraka.service)
install=haraka.install

package() {
    cd $srcdir/Haraka-$pkgver    

    npm install -g --prefix="$pkgdir"/usr Haraka@$pkgver
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    install -Dm700 $srcdir/haraka.service $pkgdir/usr/lib/systemd/system/haraka.service
    install -d $pkgdir/etc/haraka
}


sha256sums=('23e793439eb39543f645b43b5a013a329beaa85911a80f4b6814235b81bdf28f'
            '91b8d8f1f8742c103753588c50adecb36ad348e604b98a87e29d48570bdea00a')
