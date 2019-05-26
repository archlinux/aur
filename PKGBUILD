# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=psimd-git
pkgver=r25.90a938f
pkgrel=2
pkgdesc='Header-only library for portable 128-bit SIMD intrinsics (git version)'
arch=('any')
url='https://github.com/Maratyszcza/psimd/'
license=('MIT')
makedepends=('git')
provides=('psimd')
conflicts=('psimd')
source=('git+https://github.com/Maratyszcza/psimd.git')
sha256sums=('SKIP')

pkgver() {
    cd psimd
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd psimd
    
    # headers
    mkdir -p "${pkgdir}/usr/include"
    install -D -m644 include/*.h "${pkgdir}/usr/include"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
