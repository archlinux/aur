# Maintainer: Andrew Anderson <andersan@tcd.ie>
pkgname=trinnity
pkgver=0.5
pkgrel=2
pkgdesc="C++ library of CNN primitive operations"
arch=('any')
url="https://bitbucket.org/STG-TCD/trinnity"
license=('BSD')
groups=()
depends=()
makedepends=('doxygen')
checkdepends=()
optdepends=('gsl>=2.3: GSL BLAS backend'
            'atlas-lapack>=3.10.3: ATLAS BLAS backend'
            'openblas-lapack>=0.2.19: OpenBLAS BLAS backend'
            'intel-mkl>=2017.17.0.1.1.132: Intel MKL BLAS backend'
            'clblas>=2.12: clBLAS BLAS backend'
	    'cblas: Plain old CBLAS backend'
            )
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://bitbucket.org/STG-TCD/trinnity/get/v$pkgver.tar.bz2")

sha512sums=("ddc229bbc52754b9e25c5a1c90011ae796873704ab810c483646d51ab4632f923291b971b2f8b873646d3a5430c234893a8816a2d999dc2081ace51c19a1312d")
sha256sums=("50ead12c89aff9ebc5d6930a3b6391fad61586e2e83ab18d7ce3aecb9c24a1e2")
sha1sums=("4dd92fbbce939bd99706286c917b07165111433e")
md5sums=("fe8cd5c95ac23dbd99d1caaad6119922")

package() {
  make -C $srcdir/STG-* DESTDIR=$pkgdir doc
  make -C $srcdir/STG-* DESTDIR=$pkgdir install
  make -C $srcdir/STG-* DESTDIR=$pkgdir install-arm32
  make -C $srcdir/STG-* DESTDIR=$pkgdir install-arm64
}
