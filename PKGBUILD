# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_pkgname=python-gaphor
pkgname="${_pkgname}-git"
pkgver=1.2.0.r50.g2521a448
pkgrel=1
pkgdesc="Simple and easy to use modeling tool for UML using GTK3"
arch=('x86_64' 'i686')
url="https://github.com/gaphor/gaphor"
license=('Apache')
source=(
	"${_pkgname}::git+${url}.git#branch=master"
)
md5sums=('SKIP')
depends=(
	'python-gaphas'
	'python-typing_extensions'
	'python-generic'
)
makedepends=(
	'git'
	'python-pip'
)
optdepends=(
)
provides=(
	"${_pkgname}"
)
conflicts=(
	"${_pkgname}"
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_pkgname}"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}

# vim: ft=PKGBUILD
