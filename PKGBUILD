# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/screamingfrogseospider

pkgname=screamingfrogseospider
pkgver=2.11
pkgrel=1
pkgdesc="A small desktop program you can install on your PC or Mac which spiders websites’ links, images, CSS, script and apps from an SEO perspective."
arch=('any')
url="http://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
depends=('java-environment' 'shared-mime-info' 'desktop-file-utils')
makedepends=()
install=screamingfrogseospider.install
source=(
  "http://www.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_all.deb"
  "LICENSE"
)
sha256sums=(
  '5c41724c5b233832b9e7d6cea4741a2c10f414626bffe79e942c7e1fc72c43f5'
  '5f32a7baef326d88754c6581883800a8d68a753bec846a1d0c190460ab7a2424'
)

build() {
  cd $srcdir/
  msg "Extracting..."
  tar xf data.tar.gz -C $pkgdir
  msg2 "Done extracting!"
}

package() {
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
