# Maintainer: CTech <ctech.exe@gmail.com>

pkgname=flatplat-mod
_submodule=flatplat
pkgver=0.1
pkgrel=1
install="${pkgname}.install"
pkgdesc="Edited version of the Flat-Plat Gnome Shell theme"
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Flat-Plat+Mod?content=174427"
license=('GPL')
depends=('gtk3>=3.18' 'gtk2' 'gnome-shell>=3.18')
optdepends=('gnome-tweak-tool: activate the theme')
source=(
"$pkgname.tar.gz::http://gnome-look.org/CONTENT/content-files/174427-Flat-Plat%20Mod.tar.gz"
"$_submodule.tar.gz::https://github.com/nana-4/Flat-Plat/releases/download/3.18.20151025/Flat-Plat-3.18.20151025.tar.gz"
)
sha256sums=('6a74bb00adc08f36e18be5947f9c55fe0b2b44c6ed8b3ffb17f469c1352c3481'
	    '69d9b570cf0f0844937fd75a669419f0b6db982eec0008c37d109980d35fd522')

build() {
  cd "${srcdir}/Flat-Plat Mod"
  cp -dfr --no-preserve='ownership,mode' * "${srcdir}/Flat-Plat"
  cd "${srcdir}"
  rm -rf "Flat-Plat Mod"
  mv "Flat-Plat" "Flat-Plat Mod"
}

package() {
  cd "${srcdir}/Flat-Plat Mod"
  rm -rfv LICENSE
  install -dm 755 "${pkgdir}/usr/share/themes/Flat-Plat Mod"
  cp -drv --no-preserve='ownership,mode' * "${pkgdir}/usr/share/themes/Flat-Plat Mod"

}
