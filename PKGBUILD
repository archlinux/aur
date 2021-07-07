# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=fsql
pkgver=0.4.0
pkgrel=1
pkgdesc='Search through your filesystem with SQL-esque queries'
arch=('x86_64')
url='https://github.com/kashav/fsql'
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
conflicts=('fsql-git')
replaces=('fsaql-git')
provides=("fsql=${pkgver}")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5f028446e31f1a8be2f8a72cd2c1ae888e748220e4c4ece38a62fd8fe41bf70a')

build() {
	cd "${pkgname}-${pkgver}"
	export GOPATH="${srcdir}"
	go get -u -v ${url/https:\/\//}/...
}

package() {
	install -Dm 775 "${srcdir}/bin/${pkgname}" \
		"${pkgdir}/usr/bin/${pkgname}"
	install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
