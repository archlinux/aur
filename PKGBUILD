# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Noel Kuntze <noel.kuntze@thermi.consulting>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Joel Schaerer <joel.schaerer@laposte.net>

pkgname=textext
pkgver=1.13.0
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
sha512sums=('d3d6babd2ec33c61641e3babc597c461bc0b35ace6dfa317e0d3c28a986758f06bc4717a118be986b0a1eaf8b4916c33dbaa3afaf0994bcda215c2fe8b24de3f')

package() {
  cd ${pkgname}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --inkscape-extensions-path="${pkgdir}/usr/share/inkscape/extensions"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
