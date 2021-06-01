# Maintainer: Sabu Siyad <ssiyad at disroot dot org>

pkgname=clubhouse
pkgver=1.0.2
pkgrel=1
pkgdesc="An unofficial Clubhouse desktop client"
arch=('x86_64')
url="https://github.com/callmearta/clubhouse-desktop"
license=("MIT")
provides=("clubhouse")
source=(
    "$url/releases/download/${pkgver}/clubhouse-linux-x64.zip"
    "clubhouse.sh"
    "clubhouse.desktop"
)
sha256sums=(
    "5d6fa337491bce097afa3a4d4b7b0f2a63ccb49f4ad6c717e16202edd785c297"
    "06a48453ecaa9140e614f42c9460da13fe78bd1c47e3179bc7c66cdfe248d3d3"
    "bccaf37ecb6b90529eb520fd19eeb33547a6b3e16bc48788c1749c6cde325aa7"
)

package() {
    cd ${srcdir}
    install -Dm755 clubhouse.sh "${pkgdir}"/usr/bin/"${pkgname}"
    install -Dm755 clubhouse.desktop "${pkgdir}"/usr/share/applications/clubhouse.desktop
    mkdir -p "${pkgdir}"/usr/lib/
    cp -r clubhouse-linux-x64 "${pkgdir}"/usr/lib/"${pkgname}"
    install -Dm644 clubhouse-linux-x64/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
