# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-text-editor
pkgver=6.31.0
pkgrel=1
pkgdesc='Advanced embeddable text editor'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-text-editor'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'editorconfig-core-c'
	'glibc'
	'libgcc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'qt6-speech'
	'sonic-frameworks-archive'
	'sonic-frameworks-auth'
	'sonic-frameworks-autocomplete'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-data-views'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-ui'
	'sonic-frameworks-spell-check'
	'sonic-frameworks-syntax-highlighting'
	'sonic-frameworks-text-codec'
	'sonic-frameworks-ui-components'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-xml-gui'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=('git: git integration')
provides=('ktexteditor')
conflicts=('ktexteditor')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b0ed0a0ca055e15fa222f38fde38d8b049c40e640d04490037fb072b64992c58')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
