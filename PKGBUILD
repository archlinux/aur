# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
_pkgname=makepkg-tidy-scripts
pkgname=${_pkgname}-git
pkgver=0.r7.4af5db2
pkgrel=1
pkgdesc='Collection of scripts for tidying packages created using makepkg. Includes optipng and upx support.'
arch=('any')
url='https://gitlab.com/Freso/makepkg-tidy-scripts'
license=('GPL')
makedepends=('git')
optdepends=(
  'optipng: For optipng tidy script.'
  'upx: For upx tidy script.'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm755 optipng.sh "$pkgdir"/usr/share/makepkg/tidy/optipng.sh
  install -Dm755 upx.sh "$pkgdir"/usr/share/makepkg/tidy/upx.sh
}
