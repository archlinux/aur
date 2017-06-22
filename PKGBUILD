# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=fsql
pkgver=0.3.0
pkgrel=1
pkgdesc='Search through your filesystem with SQL-esque queries'
arch=('i686' 'x86_64')
url='https://github.com/kshvmdn/fsql'
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
conflicts=('fsql-git')
replaces=('fsaql-git')
provides=("fsql=${pkgver}")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8dafa4680e6f72e1f0a52de7b0cd683de533db4635569de2a35a7122091325f7')
_gourl="github.com/kshvmdn/${pkgname}/cmd/${pkgname}"

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go get -u -v ${_gourl}
}

package() {
  install -Dm 775 "${srcdir}/bin/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
