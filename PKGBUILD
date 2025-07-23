# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Noel Kuntze <noel.kuntze@thermi.consulting>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Joel Schaerer <joel.schaerer@laposte.net>

pkgname=textext
pkgver=1.12.0
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
sha512sums=('9205843834fb0147db703c66ce8579b1ec91b98ce39d8ecf50a73cac0a81311d07995720bb5510a46cfec0ea39aafca8b000dfc41d916e08dfb082b6c106378f')

package() {
  cd ${pkgname}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --inkscape-extensions-path="${pkgdir}/usr/share/inkscape/extensions"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
