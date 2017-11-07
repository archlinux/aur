# Maintainer: Daniël de Kok <me@danieldk.eu>
pkgname=alpino
pkgver=21161
pkgrel=1
pkgdesc="A wide-coverage dependency parser for Dutch"
arch=("x86_64")
url="http://www.let.rug.nl/vannoord/alp/Alpino"
license=('LGPL2.1')
depends=('tcl' 'tk')
source=("http://www.let.rug.nl/vannoord/alp/Alpino/versions/binary/Alpino-x86_64-Linux-glibc-2.19-${pkgver}-sicstus.tar.gz"
        alpino.sh
        README.hidpi)
sha256sums=('c10077c775b188eb228e372cf0285e373b9716301a45992dc5aa2a50ab6894e3'
            '6713cc676d10976b20c0f0bbb49a17e3d06dc75dd838dd592c10e734b1313ba7'
            '26ab72433994fe2d22f13e95a9c9f6ecdb5b42e3801fa7d1b542f1de44fdded7')

package() {
  install -dm 755 "${pkgdir}"/{usr/lib,usr/bin,usr/share/doc/alpino}
  cp -R "$srcdir"/Alpino "${pkgdir}"/usr/lib/alpino

  install -m 755 "$srcdir"/alpino.sh "${pkgdir}"/usr/bin/alpino
  install -m 655 "$srcdir"/README.hidpi "${pkgdir}"/usr/share/doc/alpino/README.hidpi
}
