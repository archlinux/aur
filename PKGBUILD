# Maintainer: Filip Parag <aur@filiparag.com>

pkgname=wmrc
pkgver=1.1
pkgrel=6
pkgdesc='WMRC is a shell utility for extending window manager capabilities using modules with dependency and error checking.'
arch=('any')
url='https://github.com/filiparag/wmrc'
license=('MIT')
depends=('dash')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ee6bfdac42cc5d7e30e7af593ada869ce71a33a9cb8cc9bcb22040ac044c7bfc')

package() {

  cd "${pkgname}-${pkgver}"
  
  install -Dm 755 -t "${pkgdir}/usr/bin/" "${pkgname}" 
  
  install -Dm 644 'wmrc.man' "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

  install -Dm 644 -t "${pkgdir}/usr/share/${pkgname}" 'rc.conf' 'usage.txt'
  cp -r --preserve=mode "modules" "${pkgdir}/usr/share/${pkgname}/"
  
}