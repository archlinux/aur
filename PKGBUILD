# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kpt-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0_beta.9
_pkgver="${pkgver/_/-}"
pkgrel=1
pkgdesc='Git-native tool for packaging, customizing, validating, and applying Kubernetes resources'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://kpt.dev'
license=('Apache')
depends=(
	'diffutils'
	'docker'
	'git'
	'kubectl'
)
provides=("$_pkgname")
conflicts=(
	"$_pkgname"
	"$_pkgname-git"
)
source=("$_pkgname-$_pkgver::https://github.com/googlecontainertools/$_pkgname/releases/download/v$_pkgver/${_pkgname}_${_goos}_${_goarch}")
b2sums=(0d4fe7173aeb35fde2d022f5b14d227f7042725cb5fb19697ba8cf21bb491776fb26c321fc2ff30987beca6f41f11a2e62d088085fdabf21a0193fea1f21da4d)

package() {
	install -Dm 755 "$_pkgname-$_pkgver" "$pkgdir/usr/bin/$_pkgname"
}
