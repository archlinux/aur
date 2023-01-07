# Maintainer: zurrty <justinsane3014 at gmail>
pkgname=primer-git
_pkgname=primer
pkgver=0.1.0
pkgrel=1
pkgdesc="PRIME GPU offload helper for Wayland systems"
arch=('x86_64')
url="https://github.com/zurrty/primer"
license=('GPL')
depends=('git' 'pacman' 'systemd-libs')
makedepends=('cargo')
optdepends=('zenity: showing user dialogs' 'kdialog: showing user dialogs')
provides=('primer')
conflicts=('primer')
source=("git+https://github.com/zurrty/primer")
sha256sums=(SKIP)

build() {
  cd "$srcdir/$_pkgname"
    cargo build --release --target-dir target
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/primer "${pkgdir}/usr/bin/primer"
}
