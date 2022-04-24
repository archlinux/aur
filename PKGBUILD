pkgname=rocblas-polaris-bin
pkgver=5.1.1
pkgrel=2
pkgdesc='Next generation BLAS implementation for ROCm platform , patched for the Polaris architure'
arch=('x86_64')
url='https://rocblas.readthedocs.io/en/latest'
license=('MIT')
depends=('hip' 'openmp')
makedepends=('wget')
provides=('rocblas')




package() {
        wget https://github.com/xuhuisheng/rocm-gfx803/releases/download/rocm511/rocblas_2.43.0-490c4140.dirty_amd64.deb
	
	  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/rocblas.conf" << EOF
/opt/rocm/rocblas/lib
EOF
	
	ar x "${srcdir}"/rocblas_2.43.0-490c4140.dirty_amd64.deb 
	tar -C "${pkgdir}" -xf data.tar.gz
}
