# Maintainer: Shorin <shorin@example.com>
pkgname=linuxqq-wayland-fix
pkgver=0.2.13
pkgrel=1
pkgdesc="修复 Linux QQ 在 Wayland 下的屏幕共享、共享电脑声音、剪贴板和截图问题"
arch=('x86_64' 'aarch64')
url="https://github.com/SHORiN-KiWATA/linuxqq-wayland-fix"
license=('MIT')
depends=('glibc' 'glib2' 'libx11' 'wayland' 'linuxqq')
makedepends=('libpulse' 'libpipewire' 'pkgconf')
provides=('linuxqq-wayland-fix')
conflicts=('linuxqq-wayland-fix-git' 'linuxqq-clipsync')
options=('!debug')
optdepends=('xdg-desktop-portal: 屏幕录制（需要合成器对应的后端）')

source=("$pkgname-$pkgver.tar.gz::https://github.com/SHORiN-KiWATA/linuxqq-wayland-fix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ebc6f55168f35d11c35000c285057f19b45030f6432c19a650ca1bc20f2c36b7')

build() {
    cd "$pkgname-$pkgver"
    make VERSION="$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr VERSION="$pkgver"
}
