pkgname=fenriz-bin
pkgver=0.1.17
pkgrel=1
pkgdesc="A fast, stable tiling Wayland compositor (Binary Release)"
arch=('x86_64')
url="https://github.com/zackb/fenriz"
license=('MIT')
depends=('wlroots0.20' 'scenefx0.5' 'wayland' 'libxkbcommon' 'pixman' 'libinput' 'libxcb' 'xcb-util-wm')
optdepends=('xorg-xwayland: X11 application support'
            'fenriz-desktop: wallpaper, launcher, lock screen, notifications and OSDs'
            'fenriz-bar: status bar')
provides=('fenriz')
conflicts=('fenriz' 'fenriz-git')
source=("${url}/releases/download/v${pkgver}/fenriz-${pkgver}.tar.gz")
sha256sums=('12ddee715e558fd7cb83dacc5305c9745ed9cc04103ad0e936b205bcaedb8272')

package() {
    cd "fenriz-${pkgver}"

    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr "$pkgdir/"
}
