# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=gnome-shell-extension-workspace-matrix
_repo=gnome-shell-wsmatrix
pkgver=9.0
pkgrel=2
pkgdesc='Arrange workspaces in a two dimensional grid with workspace thumbnails'
arch=(x86_64)
url=https://github.com/mzur/gnome-shell-wsmatrix
license=(GPL3)
depends=(gnome-shell)
source=(${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/mzur/${_repo}/archive/v${pkgver}.tar.gz)
sha256sums=('0dcb1e081653ff10b9e6195cff558efc0a3d34c37dcba8c8f4c9ef64dfe6f5c5')

_uuid=wsmatrix@martin.zurowietz.de

package() {
  cd ${_repo}-${pkgver}/${_uuid}
  install -Dm644 metadata.json *.js -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
  install -Dm644 "schemas/org.gnome.shell.extensions.wsmatrix.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  install -dm755 overview "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/overview/"
  install -dm755 workspacePopup "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/workspacePopup/"
  cp -r overview/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/overview/"
  cp -r workspacePopup/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/workspacePopup/"
}
