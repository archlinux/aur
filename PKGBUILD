# Maintainer: Silas Henrique <silash35@gmail.com>
pkgname=qpdftools
pkgver=2.0.1
pkgrel=0
epoch=0
pkgdesc="Qpdf Tools is an easy-to-use Qt interface for Ghostscript and QPDF"
arch=(x86_64)
url="https://github.com/silash35/qpdftools"
license=('Unlicense')
depends=('ghostscript' 'qpdf' 'qt5-base' 'qt5-svg' 'breeze-icons')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'qt5-tools')
provides=('qpdftools')
conflicts=('qpdftools-git')

source=("https://github.com/silash35/qpdftools/archive/v$pkgver.tar.gz")
md5sums=('59e5a6bcf9f2fc82762cf1199e22edca')
sha512sums=('3563a5e955ce8de6dc3c285d2d571e7344a7ee43de8321d52239383e59ebd202ed6312ce8176de841e14c1d4ddecd66ef53a965b6ea168ff3d2607ba95d10677')

build() {
    cd qpdftools-$pkgver
    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd qpdftools-$pkgver
    make DESTDIR="$pkgdir/" install
}
