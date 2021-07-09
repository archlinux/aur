# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-preflight-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=0.13.2
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
b2sums=(2f188e0f3acfffb09f8571fac9d66ab16f4841a1e071b57bd578436a81fed55ce0b610df3e8a7030cc70b6964f80f45398242ac8561c889fd100e8a42cdd3eaf)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/${_pkgname}"
}
