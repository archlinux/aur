# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=kubectl-kots-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=1.30.0
pkgrel=1
pkgdesc='Kubectl plugin and admin console to help manage Kubernetes Off-The-Shelf (KOTS) software'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://kots.io"
license=('Apache')
depends=('kubectl')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname2}_${pkgver}_${_goos}_${_goarch}.tar.gz::https://github.com/replicatedhq/$_pkgname2/releases/download/v$pkgver/${_pkgname2}_${_goos}_${_goarch}.tar.gz")
sha256sums=(3c19e347305ff7c7bdb253404648d816581a44db5535a8ccbeacfafc9f519177)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/${_pkgname}"
}
