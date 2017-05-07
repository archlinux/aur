# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=psimd-git
pkgver=r15.0b26a3f
pkgrel=1
pkgdesc="Header-only library for portable 128-bit SIMD intrinsics (git version)"
arch=('any')
url="https://github.com/Maratyszcza/psimd/"
license=('MIT')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/Maratyszcza/psimd.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, no tags available
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    
    # directories creation
    mkdir -p "${pkgdir}/usr/include"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # include
    install -D -m644 include/*.h "${pkgdir}/usr/include"
    
    # license
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
