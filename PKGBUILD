# Maintainer: Árni Dagur <arnidg@protonmail.ch>
pkgname=futhark
pkgver=0.10.2
pkgrel=2
pkgdesc="A data-parallel functional programming language."
arch=('x86_64')
url='https://futhark-lang.org/'
license=('ISC')
depends=('ncurses5-compat-libs' 'zlib')
optdepends=('opencl-headers: OpenCL backend'
            'cuda: CUDA backend'
            'python-pyopencl: PyOpenCL backend')
source=("https://github.com/diku-dk/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-linux-x86_64.tar.xz")
sha512sums=('05bd265a98681ccdbc2183d3db80057e632f68f64c5924a40b0650b60f8b2dc5381caf37bd0e3ee5e5db656150d7155c28dac589246f764eeaf7713d5ac12d6f')

package() {
    cd "$srcdir/$pkgname-$pkgver-linux-x86_64"
    make PREFIX="$pkgdir/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
