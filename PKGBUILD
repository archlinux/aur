# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=gnome-shell-extension-workspace-matrix
_repo=gnome-shell-wsmatrix
_pkgver=6.0.0-beta
pkgver=${_pkgver/-/_}
pkgrel=1
pkgdesc='Arrange workspaces in a two dimensional grid with workspace thumbnails'
arch=(x86_64)
url=https://github.com/mzur/gnome-shell-wsmatrix
license=(GPL3)
depends=(gnome-shell)
source=(${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/mzur/${_repo}/archive/v${_pkgver}.tar.gz)
sha256sums=('d2c4048e9a265657c061899ace821309e6c2639912532500317cd4b020338a98')

_uuid=wsmatrix@martin.zurowietz.de

package() {
  cd ${_repo}-${_pkgver}/${_uuid}
  install -Dm644 metadata.json settings.ui *.js -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
  install -Dm644 "schemas/org.gnome.shell.extensions.wsmatrix.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}
