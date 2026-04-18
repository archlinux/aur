# Maintainer: Elpepesaurio44 <elpepesaurio44@gmail.com>
pkgname=wall-selector
pkgver=1.0
pkgrel=1
pkgdesc="Selector de wallpapers 3x3 dinámico para Wayfire/Sway con soporte Pywal (Proyecto ZeroSignal)"
arch=('x86_64')
url="https://github.com/Elpepesaurio44/wall-selector"
license=('MIT')

depends=('gtkmm3' 'nlohmann-json' 'swaybg' 'python-pywal' 'hicolor-icon-theme')

makedepends=('gcc' 'make' 'pkgconf' 'git')

source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    
    # Instalamos el binario en /usr/bin/
    install -Dm755 wall-selector "${pkgdir}/usr/bin/wall-selector"
    
}
