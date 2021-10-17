# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-preflight-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=0.16.0
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
b2sums=(daf3857c96cda934a17c8cd69cc685c7aca02abaf164b493b3aa943a0f310df47f5d11913f4a95e47e8a04ec653d1c20505755ad67673a81a14d54f52aa8a93d)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/${_pkgname}"
}
