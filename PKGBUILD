# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Noel Kuntze <noel.kuntze@thermi.consulting>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Joel Schaerer <joel.schaerer@laposte.net>

pkgname=textext
pkgver=1.11.0
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
sha512sums=('0db4ea2ab90929c706592ebb4fff21beb1ed23bcd36e3b83398cd10f714ff7d71f139500b4486a6c5dcd6ea696692c88a2316c8f6213e2899cfed4e22bae96fe')

package() {
  cd ${pkgname}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --inkscape-extensions-path="${pkgdir}/usr/share/inkscape/extensions"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
