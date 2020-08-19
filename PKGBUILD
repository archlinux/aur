# Maintainer: ccat3z <c0ldcat3z@gmail.com>

pkgname=mirror-sync
pkgver=1.3.9
pkgrel=1
pkgdesc="A tool for real-time, two-way sync for remote (e.g. desktop/laptop) development"
arch=("x86_64")
url="https://github.com/stephenh/mirror"
license=('APACHE')
depends=('jre8-openjdk-headless' 'watchman')
source=("mirror-${pkgver}.jar::https://github.com/stephenh/mirror/releases/download/${pkgver}/mirror-all.jar"
        "mirror")
noextract=("mirror-${pkgver}.jar")
sha256sums=('3d271957a9d5f6cff225b01d4af019a4a0e762706535f87f2ac25dbab9aea2ee'
            '026dde44b41c2f21d3cfe36ce957928f1f89bce18cf8bbea49f3407af7ed05a1')

package() {
    install -Dm 755 ./mirror $pkgdir/usr/bin/mirror
    install -Dm 755 "./mirror-${pkgver}.jar" $pkgdir/usr/share/java/mirror/mirror-all.jar
}
