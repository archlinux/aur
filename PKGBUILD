# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-tiling-assistant
_pkgname=Tiling-Assistant
pkgver=40
pkgrel=1
pkgdesc="A GNOME Shell extension to expand GNOME's native 2 column design."
arch=('any')
url="https://github.com/Leleat/Tiling-Assistant"
license=('GPL2')
depends=('gnome-shell')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("*tiling-assistant@leleat-on-github*")
b2sums=('07d0d4b40050d55fd81c0cda199351caf5d9010546a8c6913d99c7e125645c3e929785aa0180c865fa8fbc1d5a09a0c0ee30ec435336f547d690f2dd6df2e7a1')
_uuid=tiling-assistant@leleat-on-github

build() {
  cd "${srcdir}/Tiling-Assistant-${pkgver}"

  gnome-extensions pack "${_uuid}" \
    --force \
    --podir="../translations" \
    --extra-source="src" \
    --extra-source="media"
}

package() {
  cd "${srcdir}/Tiling-Assistant-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions"
  unzip ${_uuid}.shell-extension.zip \
    -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
