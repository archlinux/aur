# Maintainer: Mark Coolen
# Contributor: Dan Serban

pkgname=ostorybook
_pkgname=oStorybook
pkgver=5.59
pkgrel=1
pkgdesc="Open Source Novel Writing Software for Novelists, Authors and Creative Writers"
arch=(any)
url="http://ostorybook.tuxfamily.org"
license=(GPL)
depends=('java-runtime>8')
source=("http://download.tuxfamily.org/ostorybook/current/oStorybook-${pkgver}.zip")
sha256sums=('315ced0bcaa59274289b90632e245aedc413a32149ba549a1be98d053733bcff')
options=('!strip')

package()
{
  install --mode 755 -D -T "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -D -t "${pkgdir}/usr/share/${pkgname}" ./*.*
  cp -r Assistant "${pkgdir}/usr/share/${pkgname}"
  cp -r lib "${pkgdir}/usr/share/${pkgname}"
  
  # Create Desktop file
  install -d "${pkgdir}/usr/share/applications"
  DESKTOPFILE="${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=${_pkgname}" >> "${DESKTOPFILE}"
  echo "Comment=Open Source Novel Writing Software for Novelists, Authors and Creative Writers" >> "${DESKTOPFILE}"
  echo "Exec=${_pkgname}" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Icon=/usr/share/${pkgname}/${_pkgname}-icon.png" >> "${DESKTOPFILE}"
  echo "Categories=Office;" >> "${DESKTOPFILE}"
}

