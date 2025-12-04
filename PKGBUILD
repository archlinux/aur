# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Vladimir-csp
pkgname=app2unit
pkgver=1.2.1
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
sha256sums=('cb2ff757c27765d99a8311f350bd94f8bd0fc8f6792095064a92be8769dad026')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	DESTDIR="${pkgdir}" prefix='/usr' make install
}
