# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgbasename=catppuccin-wallpapers
pkgname=${pkgbasename}-git
pkgver=r58.4760c0c
pkgrel=1
pkgdesc="Wallpapers to match your Catppuccin setups!"
url="https://github.com/catppuccin/wallpapers"
license=('MIT')
arch=('any')
source=("$pkgbasename::git+https://github.com/catppuccin/wallpapers.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbasename"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgbasename"

  install -d "${pkgdir}"/usr/share/backgrounds/"${pkgbasename}"

  cp -dr --no-preserve=ownership {dithered,gradients,landscapes,mandelbrot,minimalistic,misc,os,patterns,solids,waves} "${pkgdir}"/usr/share/backgrounds/"${pkgbasename}"

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgbasename"/
}
