# Maintainer: Cooky-12 cooky-12@qq.com

pkgname=nvidia-patch-hook
pkgver=1.0
pkgrel=1
pkgdesc="a patch inspired by dartraiden/NVIDIA-patcher to patching NVIDIA DKMS driver"
arch=( 'any' )
license=( 'custom' )
depends=( 'bash' 'python' )
install=nvidia-patch-hook.install
source=( '00-nvidia-patch.hook'
         'nvp.py' )

sha256sums=( '4649612cdc8b6abdf276077bea1ef46c3ff384f854f039e7667529d4aec88d29' 
             'e1d9972083702c7299eff44670e08d3c137d2a7ae28cc3aa6845b4a9364ddc52' )

package() {
    install -Dm444 $srcdir/00-nvidia-patch.hook $pkgdir/etc/pacman.d/hooks/00-nvidia-patch.hook
    install -Dm444 $srcdir/nvp.py               $pkgdir/etc/pacman.d/hooks/nvp.py
}
