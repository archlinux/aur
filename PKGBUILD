# Maintainer: acedmicabhishek <acedmicabhishek@gmail.com>
pkgname=kerneldrive
pkgver=0.1.0
pkgrel=2
pkgdesc="Modular Linux system control application (Ghub, Armoury Crate, Ryzen Controller)"
arch=('x86_64')
url="https://github.com/acedmicabhishek/KernelDrive"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'hidapi' 'libdrm' 'libx11' 'libxrandr' 'polkit')
makedepends=('meson' 'ninja' 'git' 'gcc')
optdepends=('ryzenadj: Ryzen CPU Power Control'
            'stress-ng: CPU Stress Testing'
            'gpu-burn-git: GPU Stress Testing')
source=("git+$url")
sha256sums=('SKIP')

build() {
    arch-meson KernelDrive build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
