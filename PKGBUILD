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
_commit=HEAD
install=noon-main.install
source=("https://github.com/PharmaRacist/Noon/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/Noon-main"
    
    install -dm755 "$pkgdir/opt/noon"
    cp -r dots setup.sh "$pkgdir/opt/noon/"
    chmod +x "$pkgdir/opt/noon/setup.sh"
    
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/noon/setup.sh" "$pkgdir/usr/bin/noon"
}
