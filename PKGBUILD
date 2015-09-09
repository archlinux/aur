# Maintainer: Peter Hoeg <first name at last name dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

pkgname=caledonia-kdm-theme
pkgver=2.0
pkgrel=1
pkgdesc='Caledonia theme: KDM theme (deprecated)'
arch=('any')
url=('http://caledonia.sourceforge.net/')
license=('CCPL:by-sa')
source=("http://sourceforge.net/projects/caledonia/files/Caledonia%20KDM/Caledonia-KDM-${pkgver}.tar.gz")
md5sums=('0ff7009da2716d3e282533533d17ec68')

package() {
  mkdir -p -m755 \
  "${pkgdir}/usr/share/apps/kdm/themes" \
  "${pkgdir}/usr/share/doc/${pkgname}"

  mv Caledonia-KDM/*.{txt,html} "${pkgdir}/usr/share/doc/$pkgname"
  cp -r Caledonia-KDM           "${pkgdir}/usr/share/apps/kdm/themes"

  find $pkgdir -type d -print0 | xargs -0 chmod 755
  find $pkgdir -type f -print0 | xargs -0 chmod 644
}
