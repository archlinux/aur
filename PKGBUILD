# Maintainer: riey <creeper844@gmail.com>
# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=kime
pkgver=3.0.1
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
optdepends=('gtk3: gtk3 support'
            'gtk4: gtk4 support'
            'qt5-base: qt5 support'
            'qt6-base: qt6 support')
makedepends=('cargo' 'clang' 'llvm' 'cmake' 'cairo' 'libxcb' 'dbus')
arch=('any')
license=('GPL3')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")

sha256sums=('f383e4012fb5a5421e2d78dd6c6700a78a06d6b840abc83f69d1c469b8298931')

build() {
    cd "${pkgname}-${pkgver}"

    # Clean cache
    rm -rf build || true
    scripts/build.sh -ar
}

package() {
    cd "${pkgname}-${pkgver}"

    scripts/install.sh "${pkgdir}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
