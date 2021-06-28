# Maintainer: Tobias Markus < tobias AT miglix DOT eu >

pkgname=clang-build-analyzer
pkgver=1.2.0
pkgrel=1
pkgdesc="Clang build analysis tool using -ftime-trace"
arch=(x86_64)
url="https://github.com/aras-p/ClangBuildAnalyzer"
license=('Unlicense')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aras-p/ClangBuildAnalyzer/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('b9710ea6e8c9ad18144a61751133698b')

build() {
    cmake -B build \
        -S "ClangBuildAnalyzer-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
	cd "$srcdir/build"

    install -Dt "$pkgdir/usr/bin" ClangBuildAnalyzer
}

