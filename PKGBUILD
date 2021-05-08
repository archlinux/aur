# Maintainer: Hollow Man <hollowman at hollowman dot ml>
# Contributor: Hollow Man <hollowman at hollowman dot ml>

pkgname=gnome-shell-extension-customize-ibus
_pkgname=Customize-IBus
_commit=8f15f0ec60697c4552d45ae8a7d6364f3c4b8f16
pkgver=39
pkgrel=1
epoch=0
pkgdesc="Customize IBus for orientation, animation, font, ascii mode auto-switch, system tray menu entries, input source indicator; theme and background picture follow GNOME Night Light Mode."
arch=('any')
url="https://extensions.gnome.org/extension/4112/customize-ibus/"
license=('GPLv3')
depends=('gnome-shell>=3.38,', 'gnome-tweaks')
source=("https://github.com/HollowMan6/Customize-IBus/archive/${_commit}/${_pkgname}-${_commit}.tar.gz")
sha512sums=('SKIP')
package() {
  _uuid='customize-ibus@hollowman.ml'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions"
  cd ${_pkgname}-${_commit}
  make _build VERSION=${pkgver}
  mkdir -p $_install_dir
  mv _build ${_install_dir}/${_uuid}
}
