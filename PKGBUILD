# Maintainer: Jan Fader <jan.fader@web.de>
pkgname=hibiscus
pkgver=2.6.14
_pkgver=2.6
pkgrel=1
pkgdesc="Nice HBCI banking program in form of a plugin for jameica."
arch=('i686' 'x86_64')
url="https://www.willuhn.de/projects/hibiscus/"
license=("GPL")
depends=('java-runtime>=1.5' 'jameica>=2.2' 'libstdc++5')
makedepends=('unzip')
optdepends=('pcsclite')
options=('!strip')
install=hibiscus.install
source=("${pkgname}-${pkgver}::https://www.willuhn.de/projects/hibiscus/releases/${_pkgver}/${pkgname}.zip" "hibiscus.desktop")
sha512sums=('d36c59b1549d8a342aec93e76f8199c38c098ca08c109e03b3502f679ad658a4542b2a0098e75ded9d1188db493a1a7ad3d5ccf19a2755f7cc3cd8a200c619d2'
            'ceea9cc5cf438893b2f5dfe46f46840448353f35719216ccca0b8dd12369d4e3c91d393c7c8b5b842a64537c61864ce8ca48e1895bb3f41c5083794399a21925')

package() {
  mkdir -p $pkgdir/opt/jameica/plugins
  mkdir -p $pkgdir/usr/share/applications
  cd $srcdir
  cp -r $pkgname $pkgdir/opt/jameica/plugins
  install -m 644 $srcdir/hibiscus.desktop $pkgdir/usr/share/applications
}
