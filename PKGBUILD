# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kpt-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0_beta.5
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
b2sums=(cca8d5997cff8723663f4e857e08501f6ad61d699f2674b6c148dc7a63b827783799f6deb8f4c1faa892327fb00396e204a2d1ef90c8ee0688b21206c60c11b3)

package() {
	install -Dm 755 "$_pkgname-$_pkgver" "$pkgdir/usr/bin/$_pkgname"
}
