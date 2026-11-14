# Maintainer: Emiliano Fernandez <neondeex@users.noreply.github.com>
pkgname=atlas-filemanager-bin
pkgver=0.1.6_beta.2
pkgrel=1
pkgdesc='Modern file manager built with Rust and GPUI'
arch=('x86_64')
url='https://atlasnative.com'
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'openssl' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'fontconfig' 'wayland' 'vulkan-icd-loader' 'libglvnd' 'ttf-dejavu')
provides=('atlas' 'atlas-filemanager')
conflicts=('atlas' 'atlas-filemanager')
options=('!strip')
source=('https://github.com/neondeex/atlas-filemanager/releases/download/v0.1.6-beta.2/atlas-0.1.6-beta.2-linux-x86_64.tar.gz')
sha256sums=('dd6e49643973fbc3955f88ad2dc5c9eeb2aca953f6f959d2e3cae52356bbda10')

package() {
    for binary in atlas atlas-search-service atlas-cloud-extension atlas-icon-extension; do
        install -Dm755 "$srcdir/atlas-0.1.6-beta.2-linux-x86_64/bin/$binary" "$pkgdir/usr/bin/$binary"
    done
    mkdir -p "$pkgdir/usr/share"
    cp -a "$srcdir/atlas-0.1.6-beta.2-linux-x86_64/share/." "$pkgdir/usr/share/"
}
