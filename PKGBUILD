pkgname=fenriz-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="A minimal tiling Wayland compositor built on wlroots and SceneFX (Binary Release)"
arch=('x86_64')
url="https://github.com/zackb/fenriz"
license=('MIT')
depends=('wlroots0.20' 'scenefx0.5' 'wayland' 'libxkbcommon' 'pixman' 'libinput' 'libxcb' 'xcb-util-wm')
optdepends=('xorg-xwayland: X11 application support')
provides=('fenriz')
conflicts=('fenriz' 'fenriz-git')
source=("${url}/releases/download/v${pkgver}/fenriz-${pkgver}.tar.gz")
sha256sums=('e4151a51102a7f99ccd9f81f289260a03640c8eb5cfa336b24898c2e362eba7b')

package() {
    cd "fenriz-${pkgver}"

    # copy files while preserving structure and stripping local ownership
    cp -dr --no-preserve=ownership usr "$pkgdir/"
}
