# Maintainer:  Joakim Hernberg <jhernberg at alchemy dot lu>

pkgname=zita-njbridge
pkgver=0.1.1
pkgrel=2

pkgdesc="Jack client to transmit audio over a local IP network."
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
arch=('i686' 'x86_64')
license=('GPL3')

depends=('jack' 'zita-resampler')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('e32a5223511ed4879fc6fe226b448cb9')

build() {
    cd "$pkgname-$pkgver/source"
    make PREFIX=/usr
}

package() {
    cd "$pkgname-$pkgver"/source
    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/share/man/man1

    install -m 755 zita-j2n "$pkgdir"/usr/bin
    install -m 755 zita-n2j "$pkgdir"/usr/bin
    install -m 644 zita-njbridge.1.gz "$pkgdir"/usr/share/man/man1
    install -m 644 zita-j2n.1.gz "$pkgdir"/usr/share/man/man1
    install -m 644 zita-n2j.1.gz "$pkgdir"/usr/share/man/man1
}
