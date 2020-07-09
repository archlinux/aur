# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=grub-theme-poly-dark-git
pkgver=r43.567b00c
pkgrel=1
pkgdesc='Simple dark GRUB theme'
arch=('any')
url='https://www.pling.com/p/1230780'
license=('MIT')
optdepends=('grub-customizer: GUI tool to configure GRUB')
makedepends=('git')
source=("poly-dark::git+https://github.com/shvchk/poly-dark")
sha256sums=('SKIP')

pkgver() {
  cd poly-dark
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "${pkgdir}"/usr/share/grub/themes/
  install -Dm644 poly-dark/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r --no-preserve=ownership poly-dark "${pkgdir}"/usr/share/grub/themes/
  rm -rf "${pkgdir}"/usr/share/grub/themes/poly-dark/.git
  rm "${pkgdir}"/usr/share/grub/themes/poly-dark/LICENSE
  rm "${pkgdir}"/usr/share/grub/themes/poly-dark/README.md
  rm "${pkgdir}"/usr/share/grub/themes/poly-dark/install.sh
}