# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Some parts of this file inspired from czmq-git, ansible-core-git, and spotify packages.

pkgname=mtodo
pkgver=1.0.1
pkgrel=2
pkgdesc='Simple Todo Software for GNU/Linux'
arch=('i686' 'x86_64')
url='https://github.com/mortymacs/mtodo'
license=('GPL')
depends=('python3' 'python-gobject' 'gtk3')
source=("https://github.com/mortymacs/mtodo/archive/v${pkgver}.tar.gz")
sha256sums=('b617f14339fcf7a69f2f063f87825095704a0ea69e4216ca89c93f1a9f8bac0b')

package() {
  cd "$pkgname-$pkgver"

  echo "installing license..."
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/mtodo"

  echo 'installing packages...'
  mkdir -p "${pkgdir}/opt/mtodo"
  cp -r ./bin "${pkgdir}/opt/mtodo"
  cp -r ./src "${pkgdir}/opt/mtodo"
  cp -r ./styles "${pkgdir}/opt/mtodo"
  chmod -R 655 "${pkgdir}/opt/mtodo"
  install -Dm 644 mtodo.png "${pkgdir}/usr/share/pixmaps/mtodo.png"
  install -Dm 644 mtodo.png "${pkgdir}/opt/mtodo/mtodo.png"
  install -Dm 644 ../../mtodo.desktop "${pkgdir}/usr/share/applications/mtodo.desktop"
}
