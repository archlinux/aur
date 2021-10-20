# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-kots-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=1.54.0
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
b2sums=(13429b84139da9a83b7185dbe4f2d28aee4f97b583da7ea3281499e9da0203f2a8bf340fe542a4cba88168ddb072148c20e2bf39de04de7b208ec9e6e45b361f)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/${_pkgname}"
}
