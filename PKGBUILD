# Maintainer: Marcel Campello <marcel@prafrentex.com.br>
pkgname=nvidia-pacman-hook
pkgver=1.1.0
pkgrel=1
pkgdesc='Update initramfs after a NVIDIA driver upgrade.'
arch=('any')
url='https://wiki.archlinux.org/title/NVIDIA#pacman_hook'
license=('GPL')
optdepends=('NVIDIA-MODULE: it is the only reason to install this package')
source=('nvidia.hook'
        "${pkgname}.install")
sha256sums=('163a036a4209ef9e80086a2a7afa487b4c6eaaf544a74d48be2df88a6322ae9b'
            'c9458319b13e58806a90d87c7972bbc305bd2efccc2bbbdaac933887dfb29b8d')
install="${pkgname}.install"

package() {
  cd "${srcdir}"

  install nvidia.hook -t "${pkgdir}/etc/pacman.d/hooks" -Dm 0644
}
