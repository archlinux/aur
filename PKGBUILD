# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-preflight-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=0.13.17
pkgrel=1
pkgdesc='Kubectl plugin for pre-installation cluster conformance testing and validation (preflight checks)'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://troubleshoot.sh"
license=('Apache')
depends=('kubectl')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname2}_${pkgver}_${_goos}_${_goarch}.tar.gz::https://github.com/replicatedhq/troubleshoot/releases/download/v$pkgver/${_pkgname2}_${_goos}_${_goarch}.tar.gz")
b2sums=(a517464771be862bef03b6eb081e544ae22ef99aecd00bf9a1e7bdf300d5a14ba98954533340dfe70f0e11ec7e2230ad35e2c5394bc65e03858fd902e45d81ab)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/${_pkgname}"
}
