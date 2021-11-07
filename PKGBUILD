# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-kots-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=1.56.0
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
b2sums=(075a9f04d8e663c77f729cae012649604f630dc670f3a8f3587d147fd05cb1a2449c3b600cae09e6528f37d45561f89d14a916147ac21e9ce927a88abf1613af)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/${_pkgname}"
}
