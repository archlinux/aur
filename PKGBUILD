# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Noel Kuntze <noel.kuntze@thermi.consulting>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Joel Schaerer <joel.schaerer@laposte.net>

pkgname=textext
pkgver=1.9.0
pkgrel=1
pkgdesc="Re-editable LaTeX graphics for Inkscape"
arch=(any)
license=('custom:BSD-3-clause')
url="https://${pkgname}.github.io/${pkgname}"
makedepends=(python git)
depends=(inkscape texlive-basic pdf2svg python-lxml python-gobject python-cssselect)
source=("git+https://github.com/${pkgname}/${pkgname}.git?signed#tag=${pkgver}")
validpgpkeys=('32746E27876C1E5418BBBF7F7A9964831E98EED5') # Jan Winkler <enceladus@posteo.de>
sha512sums=('SKIP')

package() {
  cd ${pkgname}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --inkscape-extensions-path="${pkgdir}/usr/share/inkscape/extensions/"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
