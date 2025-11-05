pkgname=gzdoom-bin
pkgver=4.14.2
pkgrel=6
pkgdesc='Feature centric port for all Doom engine games'
arch=('x86_64' 'aarch64')
url="https://github.com/ZDoom/gzdoom"
license=('BSD' 'GPL3' 'LGPL3')
depends=('gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'libwebp' 'openal' 'sdl2' 'libvpx')
conflicts=("gzdoom" "gzdoom-git")
makedepends=('unzip')
sha256sums_x86_64=('15762da40d310d3688fb8a44ded3759424aa51a24277a024488a5b8aea573e2f')
sha256sums_aarch64=('863b017a9dfb7ecac9f57250751333ee6685558de9fccc70607ead8d6c7c7317')
source_x86_64=("https://github.com/ZDoom/gzdoom/releases/download/g$pkgver/gzdoom_4.14.2_amd64.deb")
source_aarch64=("https://github.com/ZDoom/gzdoom/releases/download/g$pkgver/gzdoom_4.14.2_arm64.deb")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share"
    install -dm755 "$pkgdir/opt"
    
    tar -xf "$srcdir/data.tar.xz"
    cp -r "$srcdir/usr" "$pkgdir"
    cp -r "$srcdir/opt" "$pkgdir"
    ln -s "/usr/games/gzdoom" "$pkgdir/usr/bin/gzdoom"
}
