# Maintainer: Filip Parag <aur@filiparag.com>

pkgname=wmrc
pkgver=1.0
pkgrel=2
pkgdesc='WMRC is a shell utility for extending window manager capabilities using modules with dependency and error checking.'
arch=('any')
url='https://github.com/filiparag/wmrc'
license=('MIT')
depends=('dash')
makedepends=('git')
source=('git+https://github.com/filiparag/wmrc.git')
sha1sums=('SKIP')

package() {
  cd "${pkgname}"
  install -Dm 775 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -d -m 775 "${pkgdir}/usr/share/${pkgname}"
  install -Dm 664 "rc.conf" "${pkgdir}/usr/share/${pkgname}/"
  install -Dm 664 "readme.txt" "${pkgdir}/usr/share/${pkgname}/"
  cp -r --preserve=mode "modules" "${pkgdir}/usr/share/${pkgname}/"
}