# Maintainer: riey <creeper844@gmail.com>
pkgname=kime
pkgver=2.5.5
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
optdepends=('gtk2: gtk2 support'
            'gtk3: gtk3 support'
            'gtk4: gtk4 support'
            'qt5-base: qt5 support'
            'qt6-base: qt6 support')
makedepends=('cargo' 'clang' 'llvm' 'cmake' 'cairo' 'libxcb' 'dbus')
arch=('any')
license=('GPL3')
source=(
    ${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz"
)
md5sums=('dea5c3079478d5ec33f272b372751a88')

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

