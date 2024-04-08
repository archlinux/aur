# Maintainer: Tobias Markus < tobias AT miglix DOT eu >

pkgname=clang-build-analyzer
pkgver=1.5.0
pkgrel=1
pkgdesc="Clang build analysis tool using -ftime-trace"
arch=(x86_64)
url="https://github.com/aras-p/ClangBuildAnalyzer"
license=('Unlicense')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aras-p/ClangBuildAnalyzer/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('99fae00c31943a0396b8446412bf315b')

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

