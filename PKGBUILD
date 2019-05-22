# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=gnome-shell-extension-workspace-matrix
_repo=gnome-shell-wsmatrix
pkgver=2.2.0
pkgrel=1
pkgdesc='Arrange workspaces in a two dimensional grid with workspace thumbnails'
arch=(x86_64)
url=https://github.com/mzur/gnome-shell-wsmatrix
license=(GPL3)
depends=(gnome-shell)
source=(https://github.com/mzur/${_repo}/archive/v${pkgver}.tar.gz)
sha256sums=('51c1a643d9a044a7c1b5a665fe955426b9ac76439cefe10cd4512869a898d4c1')

_uuid=wsmatrix@martin.zurowietz.de

package() {
  cd ${_repo}-${pkgver}/${_uuid}

  install -Dm644 metadata.json settings.ui stylesheet.css *.js -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
  install -Dm644 "schemas/org.gnome.shell.extensions.wsmatrix.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}
