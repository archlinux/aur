# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-kots-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=1.45.0
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
b2sums=(324bb4ea2ed87cfcef0dcccc3ead97286140d604824885a8b2d1577f7fcdd3313e6d29ee1e6030aada483666e5de24075c81cfa9195b46085958c5d4d2ad8c7d)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/${_pkgname}"
}
