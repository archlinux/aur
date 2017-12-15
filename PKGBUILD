# Maintainer: Daniël de Kok <me@danieldk.eu>
pkgname=alpino
pkgver=21161
pkgrel=2
pkgdesc="A wide-coverage parser for Dutch"
arch=("x86_64")
url="http://www.let.rug.nl/vannoord/alp/Alpino"
license=('LGPL2.1')
depends=('tcl' 'tk')
source=("http://www.let.rug.nl/vannoord/alp/Alpino/versions/binary/Alpino-x86_64-Linux-glibc-2.19-${pkgver}-sicstus.tar.gz"
        alpino.sh
        alpino.desktop
        alpino.png
        README.hidpi)
sha256sums=('c10077c775b188eb228e372cf0285e373b9716301a45992dc5aa2a50ab6894e3'
            '6713cc676d10976b20c0f0bbb49a17e3d06dc75dd838dd592c10e734b1313ba7'
            '111a506172c96b68c68fc6906e87619be1d4ce3968a0c373b3e898809f8ec7a2'
            '6c83d390b9e0f555695cc257ca54b35d1de5e0f0036659cbe034feca1929790f'
            '26ab72433994fe2d22f13e95a9c9f6ecdb5b42e3801fa7d1b542f1de44fdded7')

package() {
  install -dm 755 "${pkgdir}"/usr/lib
  cp -R "$srcdir"/Alpino "${pkgdir}"/usr/lib/alpino

  install -Dm 755 "$srcdir"/alpino.sh "${pkgdir}"/usr/bin/alpino
  install -Dm 644 "$srcdir"/alpino.desktop "$pkgdir"/usr/share/applications/alpino.desktop
  install -Dm 644 "$srcdir"/alpino.png "$pkgdir"/usr/share/pixmaps/alpino.png
  install -Dm 644 "$srcdir"/README.hidpi "${pkgdir}"/usr/share/doc/alpino/README.hidpi
}
