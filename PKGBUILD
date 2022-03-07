# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname=catppuccin-wallpapers-git
pkgver=r54.64d670b
pkgrel=1
pkgdesc="Wallpapers to match your Catppuccin setups!"
url="https://github.com/catppuccin/wallpapers"
license=('MIT')
arch=('any')
source=("$pkgname::git+https://github.com/catppuccin/wallpapers.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  install -d "${pkgdir}"/usr/share/backgrounds/"${pkgname}"

  cp -dr --no-preserve=ownership {dithered,gradients,landscapes,mandelbrot,minimalistic,misc,os,patterns,solids,waves} "${pkgdir}"/usr/share/backgrounds/"${pkgname}"

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
}
