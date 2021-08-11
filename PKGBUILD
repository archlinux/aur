# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-kots-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=1.49.0
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
b2sums=(4a887a73098f1556191bbf42f8697c4ff3ea57a8fdda058ac33ddfa99c34570c0aa7e58d2058c1e8d6284554441c8b8c9904ce185c8a43e6c8e0848c898b9b84)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/${_pkgname}"
}
