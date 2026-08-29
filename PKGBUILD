pkgname=fenriz-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="A fast, stable tiling Wayland compositor (Binary Release)"
arch=('x86_64')
url="https://github.com/zackb/fenriz"
license=('MIT')
depends=('wlroots0.20' 'scenefx0.5' 'wayland' 'libxkbcommon' 'pixman' 'libinput' 'libxcb' 'xcb-util-wm')
optdepends=('xorg-xwayland: X11 application support'
            'fenriz-desktop: wallpaper, launcher, lock screen, notifications and OSDs')
provides=('fenriz')
conflicts=('fenriz' 'fenriz-git')
source=("${url}/releases/download/v${pkgver}/fenriz-${pkgver}.tar.gz")
sha256sums=('47545b5d081224bc7765029d80bf8e35f9ed9351bcf4b211facb049f4dee423f')

package() {
    cd "fenriz-${pkgver}"

    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr "$pkgdir/"
}
