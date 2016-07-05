# Maintainer: gilzoide <gilzoide@gmail.com>

pkgname=lap-git
pkgver=r19.148013a
pkgrel=1
pkgdesc="A functional style C++11 library for parsing command line arguments"
arch=('i686' 'x86_64')
url="https://github.com/gilzoide/lap"
license=("GPL3")
depends=()
makedepends=('git' 'scons')
source=("$pkgname"::'git://github.com/gilzoide/lap.git')
md5sums=('SKIP')

# Make pkg version as last commit date
pkgver () {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Build with scons
# Change to "scons debug=1" if you want a build with debug symbols
build () {
	cd "$pkgname"
	scons
}

# Install with scons
# Change to "scons debug=1 install --prefix "${pkgdir}"" if you want a build
# with debug symbols
package () {
	cd "$pkgname"
	scons install --prefix "${pkgdir}"
}
