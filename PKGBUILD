# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Contributor: Ludvig Holtze <ludvig.holtze@protonmail.com>
# Contributor: David Thurstenson <thurstylark@gmail.com>

pkgname=ttf-dseg
pkgver=0.46
_ver_slug='046'
pkgrel=1
pkgdesc='Free font which imitate segment LCD display'
arch=('any')
license=('custom:OFL-1.1')
url='https://www.keshikan.net/fonts-e.html'
source=("fonts-DSEG_v${_ver_slug}.zip::https://github.com/keshikan/DSEG/releases/download/v${pkgver}/fonts-DSEG_v${_ver_slug}.zip")
sha256sums=('a6c2f43520971ca8067262e78d49025e605f749bf716ec5394bad9a0ee1c238c')

package() {
  cd "${srcdir}/fonts-DSEG_v${_ver_slug}"
  ttf_dst="${pkgdir}/usr/share/fonts/TTF/"
  license_dst="${pkgdir}/usr/share/licenses/${pkgname}/"
  mkdir -p "$ttf_dst" "$license_dst"
  find -name '*.ttf' -print0 | xargs -0 -i install -m644 {} "$ttf_dst"
  install -m644 DSEG-LICENSE.txt "${license_dst}/LICENSE"
}
