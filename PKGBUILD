# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=sokol-git
pkgver=r2649.bd7fa93
pkgrel=1
pkgdesc='Multiple purpose header libraries for C and C++ (git version)'
arch=('any')
url='https://github.com/floooh/sokol/'
license=('custom: zlib')
makedepends=('git')
provides=('sokol')
conflicts=('sokol')
source=('git+https://github.com/floooh/sokol.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.%s' "$(git -C sokol rev-list --count HEAD)" "$(git -C sokol rev-parse --short HEAD)"
}

package() {
    install -D -m644 sokol/{,util/}*.h -t "${pkgdir}/usr/include"
    install -D -m644 sokol/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
