# Maintainer: Lennart Husvogt <lennart at husvogt dot net>

pkgname=log4j-detector
pkgver=2021.12.20
pkgrel=1
pkgdesc="A tool for finding log4j versions vulnerable to CVE-2021-44228 and CVE-2021-45046."
arch=('any')
url="https://github.com/mergebase/log4j-detector"
license=('GPL3')
depends=('java-runtime=11')


source=("log4j-detector.sh"
        "https://github.com/mergebase/log4j-detector/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fbff41b0833342f585888de58d23b3a61c77d3d1bd137b19c003d809a9506fcc'
            'b63fecf97c2ee1a14119298b95dec59e1bdc7a44ad52671564c8df57c11bd145')


package() {
    install -Dm655 $srcdir/log4j-detector.sh \
                   $pkgdir/usr/bin/log4j-detector
    install -Dm644 $srcdir/log4j-detector-$pkgver/log4j-detector-$pkgver.jar \
                   $pkgdir/usr/share/java/log4j-detector/log4j-detector.jar
    install -Dm644 $srcdir/log4j-detector-$pkgver/LICENSE.TXT \
                   $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
