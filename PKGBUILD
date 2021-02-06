# Maintainer: riey <creeper844@gmail.com>
pkgname=kime
pkgver=1.0.0.pre3
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
depends=('gtk3' 'libappindicator-gtk3')
optdepends=('libappindicator-gtk3: indicator support'
            'gtk2: gtk2 support'
            'gtk3: gtk3 support'
            'gtk4: gtk4 support'
            'qt5-base: qt5 support'
            'qt6-base: qt6 support'
            'xcb: xim support'
            'cairo: xim support')
makedepends=('cargo' 'clang' 'llvm' 'cmake' 'ninja' 'cairo' 'libxcb' 'pango' 'gtk2' 'gtk3' 'gtk4' 'qt5-base' 'qt6-base')
arch=('any')
source=("${url}/archive/v1.0.0-pre3.tar.gz")
md5sums=('a88ca8e59e388eb1aa0492e1845f2c21')

build() {
    cd "${pkgname}-1.0.0-pre3"
    cargo xtask build --mode Release XIM WAYLAND GTK2 GTK3 GTK4 QT5 QT6
}

package() {
    cd "${pkgname}-1.0.0-pre3"
    cargo xtask install "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}


