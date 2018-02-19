# Maintainer: Bart Verhagen <barrie.verhagen at gmail dot com>
pkgname=('catch2')
pkgbase='catch2'
pkgver=v2.1.2_0_g7cbd0b58
pkgrel=1
epoch=
pkgdesc="A modern, C++-native, header-only, test framework for unit-tests, TDD and BDD - using C++11, C++14, C++17 and later"
arch=('any')
url="https://github.com/catchorg/catch2"
license=('boost')
groups=()
depends=()
makedepends=(cmake make git)
checkdepends=()
optdepends=()
provides=('catch2=v2.1.2_0_g7cbd0b58')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=catch2.changelog
source=('catch2::git+https://github.com/catchorg/Catch2.git#commit=7cbd0b587a24e5cbb9a7da9dd288f0532abfc57a')
noextract=()
validpgpkeys=()

_git_dir='catch2'
_build_dir='build'

_exec_helper_build_targets=('all')

pkgver() {
    printf "%s" $pkgver
}

build() {
    cmake -G "Unix Makefiles" -H"$_git_dir" -B"$_build_dir" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_INSTALL_LIBDIR="lib" -DCATCH_USE_VALGRIND=OFF -DCATCH_BUILD_EXAMPLES=OFF -DCATCH_ENABLE_COVERAGE=OFF -DCATCH_ENABLE_WERROR=OFF -DBUILD_TESTING=OFF
    make --directory "$_build_dir" ${_exec_helper_build_targets[@]}
}

package_catch2() {
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -P "$_build_dir/cmake_install.cmake" 
}

md5sums=('SKIP')
