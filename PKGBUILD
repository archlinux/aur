# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-tiling-assistant
_pkgname=Tiling-Assistant
pkgver=44
pkgrel=1
pkgdesc="A GNOME Shell extension to expand GNOME's native 2 column design."
arch=('any')
url="https://github.com/Leleat/Tiling-Assistant"
license=('GPL2')
depends=('gnome-shell')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("*tiling-assistant@leleat-on-github*")
b2sums=('bc32ae188341f82bcbdbf921c7f84ae3aa9ed9a5cc045d9c8169a28ed1144f1210dcad58b8bf5e784c3b019545250f043de78bd564e4fb72c50ed60fb2857d9b')
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
