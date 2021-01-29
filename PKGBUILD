# Maintainer: ccat3z <c0ldcat3z@gmail.com>

pkgname=mirror-sync
pkgver=1.3.11
_releasetag=1.3.11
pkgrel=1
pkgdesc="A tool for real-time, two-way sync for remote (e.g. desktop/laptop) development"
arch=("x86_64")
url="https://github.com/stephenh/mirror"
license=('APACHE')
depends=('jre8-openjdk-headless' 'watchman')
source=("mirror-${pkgver}.jar::https://github.com/stephenh/mirror/releases/download/${_releasetag}/mirror-all.jar"
        "mirror")
noextract=("mirror-${pkgver}.jar")
sha256sums=('c715548d49a5a623a5fd39c3036a6437bdc76e4d1e6fb1693b24effcf307594b'
            '026dde44b41c2f21d3cfe36ce957928f1f89bce18cf8bbea49f3407af7ed05a1')

package() {
    install -Dm 755 ./mirror $pkgdir/usr/bin/mirror
    install -Dm 755 "./mirror-${pkgver}.jar" $pkgdir/usr/share/java/mirror/mirror-all.jar
}
