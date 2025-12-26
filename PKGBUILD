# Maintainer: PharmaRacist
pkgname=noon-main
pkgver=2.1
pkgrel=1
pkgdesc="PharmaRacist's Perspective of a Desktop - Main package"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')
depends=(
    'noon-apps'
    'noon-dev'
    'noon-hyprland'
    'noon-python'
    'noon-services'
    'noon-looks'
    'noon-utils'
    'ntfs-3g'
    'uv'
)
optdepends=(
    'noon-nvidia: NVIDIA GPU support'
    'noon-nvidia-legacy: Legacy NVIDIA GPU support'
)
install=noon-main.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PharmaRacist/Noon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

package() {
    cd "$srcdir/Noon-${pkgver}"
    
    install -dm755 "$pkgdir/opt/noon"
    cp -r dots setup_data setup.sh "$pkgdir/opt/noon/"
    chmod +x "$pkgdir/opt/noon/setup.sh"
    
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/noon/setup.sh" "$pkgdir/usr/bin/noon"
}

