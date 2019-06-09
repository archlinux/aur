# Maintainer: Árni Dagur <arnidg@protonmail.ch>
pkgname=futhark
pkgver=0.11.1
pkgrel=1
pkgdesc="A data-parallel functional programming language."
arch=('x86_64')
url='https://futhark-lang.org/'
license=('ISC')
depends=('ncurses5-compat-libs' 'zlib')
optdepends=('opencl-headers: OpenCL backend'
            'cuda: CUDA backend'
            'python-pyopencl: PyOpenCL backend')
source=("https://github.com/diku-dk/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-linux-x86_64.tar.xz")
sha512sums=('688d19b9ac86f4c49d4ad67965077204562da80cebee9bee6e094d5ef0ed49ce771bbd68412d6d6f872b83fe93ad1eb687a0dc3dda76d561bbb12572101e463b')

package() {
    cd "$srcdir/$pkgname-$pkgver-linux-x86_64"
    make PREFIX="$pkgdir/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
