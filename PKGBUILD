# Maintainer: Enzo Fuke <projects@milesonerd.aleeas.com>
pkgname=vcs-lore
pkgver=0.8.3
pkgrel=1
pkgdesc="Next-generation open source version control system by Epic Games (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/EpicGames/lore"
license=('MIT')
provides=('vcs-lore')
conflicts=('vcs-lore-bin' 'vcs-lore-git')

source=("LICENSE")
sha256sums=('SKIP')
source_x86_64=("https://github.com/EpicGames/lore/releases/download/v${pkgver}/lore-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('55eb9e6d334c3c8d099e281931d4594a13dbda401e4cd202fa9f3114c512b299')

depends=('glibc' 'libgcc')
options=('!strip' '!debug')

package() {
    install -Dm755 "${srcdir}/lore" "${pkgdir}/usr/bin/lore"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
