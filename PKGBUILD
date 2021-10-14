# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kpt-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0_beta.7
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
b2sums=(883a6a3bee45ebcc09fd4da5d41d284b78600bfc1db7fbd0d087d8aae238b0900877e04434ae50de8e7009f6e89436b8cd3f2d0d13f5768fce0d09a3ea69a897)

package() {
	install -Dm 755 "$_pkgname-$_pkgver" "$pkgdir/usr/bin/$_pkgname"
}
