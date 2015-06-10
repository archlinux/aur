# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

pkgname=archon-exec
pkgver=1.2
pkgrel=1
pkgdesc='Wrapper script for launching Android APK files with ARChon'
arch=('any')
url='https://github.com/prurigro/archon-exec'
license=('MIT')
depends=('archon' 'chromeos-apk-git' 'chromium')
install=$pkgname.install
source=("$url/archive/v${pkgver}.tar.gz")
sha512sums=('989a33b68b047104b00ae272d6af6bd6a8a740eb563b318a20ef185c31e3f8a15d6b458494a850417976a1f4a856f00a8d72b60a261320ab1a9c5ddcf6aa3518')

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    ln -s /usr/bin/$pkgname "$pkgdir"/usr/bin/${pkgname/-exec}
}
