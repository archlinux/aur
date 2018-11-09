# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det

pkgname=eglexternalplatform-git
_srcname=eglexternalplatform
pkgver=r4.7c8f8e2
pkgrel=2
pkgdesc='EGL External Platform interface (git version)'
arch=('any')
url='https://github.com/NVIDIA/eglexternalplatform/'
license=('MIT')
makedepends=('git')
provides=('eglexternalplatform')
conflicts=('eglexternalplatform')
source=('git+https://github.com/NVIDIA/eglexternalplatform.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_srcname"
    
    install -D -m644 interface/* -t "${pkgdir}/usr/include/EGL"
    install -D -m644 *.pc -t "${pkgdir}/usr/share/pkgconfig"
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
