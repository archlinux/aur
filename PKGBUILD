pkgname=kloud
pkgver=0.2
pkgrel=1
pkgdesc="An open source and minimalistic cloud based on Kotlin"
arch=(any)
license=('custom')
depends=('java-runtime>=8' 'gradle')
url="https://github.com/texxme/Kloud"
license=('BSD')
source=(kloud $pkgname-$pkgver.tar.gz::https://github.com/texxme/Kloud/archive/v$pkgver-BETA.tar.gz)

build() {
    cd "$srcdir/Kloud-$pkgver-BETA"
    make all
}

package() {
    cd "$srcdir/Kloud-$pkgver-BETA"

    install -D -m755 "${srcdir}/kloud"         "${pkgdir}/usr/bin/kloud"
    install -D -m644 "${srcdir}/Kloud-$pkgver-BETA/build/libs/kloud-${pkgver}-BETA-all.jar"     "${pkgdir}/usr/share/kloud/kloud-${pkgver}-BETA-all.jar"
}

sha1sums=('778be42080f3dc4c15cd63568718addef2557bb3'
          'ec7409412e3eb48191d4672f276a8234f3635a3a')
