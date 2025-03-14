# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Noel Kuntze <noel.kuntze@thermi.consulting>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Joel Schaerer <joel.schaerer@laposte.net>

pkgname=textext
pkgver=1.11.1
pkgrel=1
pkgdesc="Re-editable LaTeX graphics for Inkscape"
arch=(any)
license=(BSD-3-Clause)
url="https://${pkgname}.github.io/${pkgname}"
depends=(inkscape texlive-latexextra pdf2svg python-lxml python-gobject python-cssselect)
makedepends=(git)
optdepends=('typst: for typst compiler support')
source=("git+https://github.com/${pkgname}/${pkgname}.git?signed#tag=${pkgver}")
validpgpkeys=('32746E27876C1E5418BBBF7F7A9964831E98EED5') # Jan Winkler <enceladus@posteo.de>
sha512sums=('c22192edd6cf4e47125b1e649f0e3a5b7a73cb22f058462ddcbd0b4c9c39510c756e2c459c01e2bad1164bc93d2a4454058e590e9f0a3791a1dd42092d50544a')

package() {
  cd ${pkgname}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --inkscape-extensions-path="${pkgdir}/usr/share/inkscape/extensions"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
