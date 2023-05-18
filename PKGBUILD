# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-tiling-assistant
_pkgname=Tiling-Assistant
pkgver=41
pkgrel=1
pkgdesc="A GNOME Shell extension to expand GNOME's native 2 column design."
arch=('any')
url="https://github.com/Leleat/Tiling-Assistant"
license=('GPL2')
depends=('gnome-shell')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("*tiling-assistant@leleat-on-github*")
b2sums=('bbf0e11c2509b88b7cb05e54180e5b5ab0258a8e98bacafec3e19414829eacb55d06a8a85369877d2b052ab46b6edcfe289dde87a61b29adfe5377191b95306c')
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
