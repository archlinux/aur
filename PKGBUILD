# Maintainer: Árni Dagur <arnidg@protonmail.ch>
pkgname=futhark
pkgver=0.12.1
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
sha512sums=('a120eff7e16338348f59ec3b5198b55c9d5c1ae20cb5cb649771d6db59e786a52c5ab2398fac250cc7fb3050f233c380960a337c56663d00548d49cb5ca4fcb7')

package() {
    cd "$srcdir/$pkgname-$pkgver-linux-x86_64"
    make PREFIX="$pkgdir/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
