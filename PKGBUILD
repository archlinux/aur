# Maintainer: Ondřej Hruška <ondra@ondrovo.com>

pkgname=adios
pkgver=0.2.3
pkgrel=1
pkgdesc="Simple, versatile session exit dialog, inspired by cb-exit."
arch=('any')
url='https://github.com/MightyPork/adios'
license=('MIT')

depends=('python3' 'python-gobject' 'python-docopt' 'gtk3' 'pm-utils')

source=('https://github.com/MightyPork/adios/releases/download/0.2.3/adios-0.2.3-1.tar.gz')
provides=('adios')
conflicts=('adios-git')
md5sums=('644eff4c35d624ca40092cb7e7a0271c')

package() {
  # install license
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # install files in /usr/share
  install -Dm 755 "${srcdir}/adios" "${pkgdir}/usr/share/${pkgname}/adios"
  
  # install link in /usr/bin
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /usr/share/${pkgname}/adios "${pkgdir}/usr/bin/adios"
}
