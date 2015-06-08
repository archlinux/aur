# Maintainier: FadeMind <fademind@gmail.com>

pkgname=ksplash-eternity
pkgver=2.0
pkgrel=2
pkgdesc="New version of Eternity plasma splash screen by World-fly."
arch=('any')
license=('GPL')
url="http://kde-look.org/content/show.php?content=168546"
depends=('kdebase-workspace')
source=("${pkgname}-${pkgver}.tar.gz::http://kde-look.org/CONTENT/content-files/168546-Eternity%20v2.tar.gz")
sha256sums=('3bbb16b1cd4f0889aa58ac884e7628cde2f97967bdb2af3bbe30db4d3db9b4a9')
  
package() {
  cd "${srcdir}/Eternity v2/"
  mkdir -p ${pkgdir}/usr/share/apps/ksplash/Themes/Eternity
  cp -R * ${pkgdir}/usr/share/apps/ksplash/Themes/Eternity
  sed -i -e 's|Eternity v2|Eternity|g' ${pkgdir}/usr/share/apps/ksplash/Themes/Eternity/Theme.rc
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
  find ${pkgdir}/usr -type f -name '.directory' -delete
}
