# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=plymouth-theme-bgrt-cactus
pkgver=20210802
pkgrel=1
pkgdesc="Plymouth theme with Cactus branding"
arch=("x86_64")
depends=('plymouth' 'ttf-contemporary')
makedepends=('git')
url="https://vicr123.com/cactus"
license=('GPL3')
source=("$pkgname-repo"::'git+https://github.com/vicr123/bgrt-cactus.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname-repo"
    git log -1 --format="%at" | xargs -I{} date -d @{} +%Y%m%d
}

package() {
    cd "$pkgname-repo"
    mkdir -p $pkgdir/usr/share/plymouth/themes/bgrt-cactus/
    cp * $pkgdir/usr/share/plymouth/themes/bgrt-cactus/
}
