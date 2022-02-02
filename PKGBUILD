# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kpt-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0_beta.13
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
b2sums=(baaffa645aced9d6e86aaa73c6a3598bd1b83cea7a9a032df1c7b573879350a847f42b121d290879606ffb8c801ec6037d2c4d8b72755663d8ea27c270341e31)

package() {
	install -Dm 755 "$_pkgname-$_pkgver" "$pkgdir/usr/bin/$_pkgname"
}
