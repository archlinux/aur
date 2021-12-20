# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=gnome-shell-extension-workspace-matrix
_repo=gnome-shell-wsmatrix
pkgver=6.3
pkgrel=1
pkgdesc='Arrange workspaces in a two dimensional grid with workspace thumbnails'
arch=(x86_64)
url=https://github.com/mzur/gnome-shell-wsmatrix
license=(GPL3)
depends=(gnome-shell)
source=(${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/mzur/${_repo}/archive/v${pkgver}.tar.gz)
sha256sums=('48b879d7e1f0d30a6afd836a828f2d69431eee6070696a4e370b38a919f8289f')

_uuid=wsmatrix@martin.zurowietz.de

package() {
  cd ${_repo}-${pkgver}/${_uuid}
  install -Dm644 metadata.json settings.ui *.js -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
  install -Dm644 "schemas/org.gnome.shell.extensions.wsmatrix.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  install -dm755 overview "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/overview/"
  install -dm755 workspacePopup "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/workspacePopup/"
  cp -r overview/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/overview/"
  cp -r workspacePopup/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/workspacePopup/"
}
