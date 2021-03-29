# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=gnome-shell-extension-workspace-matrix
_repo=gnome-shell-wsmatrix
pkgver=5.0.0
pkgrel=1
pkgdesc='Arrange workspaces in a two dimensional grid with workspace thumbnails'
arch=(x86_64)
url=https://github.com/mzur/gnome-shell-wsmatrix
license=(GPL3)
depends=(gnome-shell)
source=(${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/mzur/${_repo}/archive/v${pkgver}.tar.gz)
sha256sums=('1d5b5b62138df4da98c107ab80947a698aee08b8975fafd4b0ff5046c514fa46')

_uuid=wsmatrix@martin.zurowietz.de

package() {
  cd ${_repo}-${pkgver}/${_uuid}
  install -Dm644 metadata.json settings.ui *.js -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
  install -Dm644 "schemas/org.gnome.shell.extensions.wsmatrix.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}
