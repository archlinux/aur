# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Vladimir-csp
pkgname=app2unit
pkgver=1.1.2
pkgrel=1
pkgdesc="Utility to launch commands as systemd user units"
url="https://github.com/${_pkgauthor}/${pkgname}"
arch=('any')
license=('GPL-3.0-only')

provides=("${pkgname}" "${pkgname}-open" "${pkgname}-open-scope" "${pkgname}-open-service" "${pkgname}-term" "${pkgname}-term-scope" "${pkgname}-term-service")
depends=(
  sh
  systemd
  libnotify
)
makedepends=(
  make
  scdoc
)

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('481f5750e2469ecd923a5382794a37cfba91f700ec78d5c257707fe17c1fbdb9')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	DESTDIR="${pkgdir}" prefix='/usr' make install
}
