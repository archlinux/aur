# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=gnome-shell-extension-workspace-matrix
_repo=gnome-shell-wsmatrix
pkgver=2.0.0
pkgrel=1
pkgdesc='Arrange workspaces in a two dimensional grid with workspace thumbnails'
arch=(x86_64)
url=https://github.com/mzur/gnome-shell-wsmatrix
license=(GPL3)
depends=(gnome-shell)
source=(https://github.com/mzur/${_repo}/archive/v${pkgver}.tar.gz)
sha256sums=('5cbfc889d1191d8939a95464cb8f8ffe5eb7411ca1e8a2b5d8475f65b3cccccf')

_uuid=wsmatrix@martin.zurowietz.de

package() {
  cd ${_repo}-${pkgver}/${_uuid}

  install -Dm644 metadata.json settings.ui *.js -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
  install -Dm644 "schemas/org.gnome.shell.extensions.wsmatrix.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}
