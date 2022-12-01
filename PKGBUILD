# Maintainer: Hollow Man <hollowman at opensuse dot org>
# Contributor: Hollow Man <hollowman at opensuse dot org>

pkgname=gnome-shell-extension-customize-ibus
_pkgname=Customize-IBus
_commit=5eed0b430d40014a3b5e6b15600c7f1ef95b96d8
pkgver=85
pkgrel=0
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
