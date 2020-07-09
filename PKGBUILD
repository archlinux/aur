# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=grub-theme-poly-light-git
pkgver=r39.8f82f98
pkgrel=1
pkgdesc='Simple light GRUB theme'
arch=('any')
url='https://www.pling.com/p/1176413'
license=('MIT')
optdepends=('grub-customizer: GUI tool to configure GRUB')
makedepends=('git')
source=("poly-light::git+https://github.com/shvchk/poly-light")
sha256sums=('SKIP')

pkgver() {
  cd poly-light
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "${pkgdir}"/usr/share/grub/themes/
  install -Dm644 poly-light/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r --no-preserve=ownership poly-light "${pkgdir}"/usr/share/grub/themes/
  rm -rf "${pkgdir}"/usr/share/grub/themes/poly-light/.git
  rm "${pkgdir}"/usr/share/grub/themes/poly-light/LICENSE
  rm "${pkgdir}"/usr/share/grub/themes/poly-light/README.md
  rm "${pkgdir}"/usr/share/grub/themes/poly-light/install.sh
}