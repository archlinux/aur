# Maintainer: Colin Wallace <wallacoloo@gmail.com>

pkgname=gnome-shell-extension-sound-output-device-chooser-git
_gitname=gse-sound-output-device-chooser
pkgver=r6.65da144
pkgrel=1
pkgdesc="Shows a list of sound output devices (similar to gnome sound settings) in the status menu below the volume slider."
arch=('any')
url="https://github.com/kgshank/gse-sound-output-device-chooser"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
source=('git://github.com/kgshank/gse-sound-output-device-chooser.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _uuid='sound-output-device-chooser@kgshank.net'
  
  cd "${_gitname}/${_uuid}"
  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
}
