# Maintainer: Marcel Campello <marcel@prafrentex.com.br>
pkgname=nvidia-pacman-hook
pkgver=1.0.0
pkgrel=1
pkgdesc='Update initramfs after a NVIDIA driver upgrade.'
arch=('any')
url='https://wiki.archlinux.org/title/NVIDIA#pacman_hook'
license=('GPL')
optdepends=('NVIDIA-MODULE: it is the only reason to install this package')
source=('nvidia.hook'
        "${pkgname}.install")
sha256sums=('0e9934103e63e59c401125ab62434dc86ffbb4395071e79088598ddf8be6fc14'
            'c9458319b13e58806a90d87c7972bbc305bd2efccc2bbbdaac933887dfb29b8d')
install="${pkgname}.install"

package() {
  cd "${srcdir}"

  install nvidia.hook -t "${pkgdir}/etc/pacman.d/hooks" -Dm 0644
}
