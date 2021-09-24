# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kpt-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0_beta.6
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
b2sums=(5d306861c8d1bc97656a844e8a88311488173a9b90f0dfd1d4afb5dd38fd4cb54510f58f21e5900e54fec536de756ee1ac3d95c34b39945c9bbfb262d4e8c1aa)

package() {
	install -Dm 755 "$_pkgname-$_pkgver" "$pkgdir/usr/bin/$_pkgname"
}
