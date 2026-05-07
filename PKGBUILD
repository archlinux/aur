# Maintainer: Solara Linux <ash8820@proton.me>

pkgname=solara-kernel-headers
pkgver=7.0.3
pkgrel=1
pkgdesc="Solara Linux Kernel headers"
arch=('x86_64')
url="https://github.com/ravecorelabs/solara"
license=('GPL2')
depends=('solara-kernel')

source=("https://cdn77.cachyos.org/repo/x86_64_v3/cachyos-v3/linux-cachyos-headers-${pkgver}-${pkgrel}-x86_64_v3.pkg.tar.zst")
sha256sums=('SKIP')

package() {
    tar -xf "${srcdir}/linux-cachyos-headers-${pkgver}-${pkgrel}-x86_64_v3.pkg.tar.zst" -C "${pkgdir}"
    
    for d in "${pkgdir}"/usr/lib/modules/*; do
        [ -d "$d" ] && mv "$d" "${d/-cachyos/-solara}"
    done
}