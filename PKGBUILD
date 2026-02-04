# Maintainer: Marcos Bustos <markbustos1912@gmail.com>
pkgname=om-rec
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimalist, native C screen recorder for Omarchy/Hyprland (Wayland)"
arch=('x86_64')
url="https://markbus-ai.github.io/"
license=('MIT')
depends=('wf-recorder' 'slurp' 'libnotify')
makedepends=('gcc' 'make')
source=("https://github.com/markbus-ai/om-rec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e2850eaa44c42045341a58e32ee84dee9f50c58c1179f08c5e375ff6b08f5d88') # Se actualiza con 'updpkgsums' antes de subir

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    # Instalamos en /usr en lugar de ~/.local
    make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
