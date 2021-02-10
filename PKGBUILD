# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det

pkgname=eglexternalplatform-git
pkgver=1.1.r0.g7c8f8e2
pkgrel=1
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
    git -C eglexternalplatform describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    install -D -m644 eglexternalplatform/interface/* -t "${pkgdir}/usr/include/EGL"
    install -D -m644 eglexternalplatform/*.pc -t "${pkgdir}/usr/share/pkgconfig"
    install -D -m644 eglexternalplatform/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
