# Maintainer: Hollow Man <hollowman at hollowman dot ml>
# Contributor: Hollow Man <hollowman at hollowman dot ml>

pkgname=gnome-shell-extension-customize-ibus
_pkgname=Customize-IBus
_commit=e1a38c094cae2131bb1eac69123c71d9b1ec12d0
pkgver=73
pkgrel=1
epoch=0
pkgdesc="Full customization of appearance, behavior, system tray and input source indicator for IBus."
arch=('any')
url="https://extensions.gnome.org/extension/4112/customize-ibus/"
license=('GPL-3.0+')
makedepends=('gettext' 'glib2' 'make')
source=("https://github.com/openSUSE/Customize-IBus/archive/${_commit}/${_pkgname}-${_commit}.tar.gz")
sha512sums=('SKIP')
package() {
  _uuid='customize-ibus@hollowman.ml'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions"
  cd ${_pkgname}-${_commit}
  make _build VERSION=${pkgver}
  mkdir -p $_install_dir
  mv _build ${_install_dir}/${_uuid}
}
