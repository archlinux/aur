# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/screamingfrogseospider

pkgname=screamingfrogseospider
pkgver=5.1
pkgrel=1
pkgdesc="A small desktop program you can install on your PC or Mac which spiders websites’ links, images, CSS, script and apps from an SEO perspective."
arch=('any')
url="http://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
depends=('java-environment' 'shared-mime-info' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=()
install=screamingfrogseospider.install
source=(
  "http://www.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_all.deb"
  "LICENSE"
)
sha256sums=(
  'f94d2f1c91bf25b14e3270292b79d970e33c3f3bbffe91156870bb9659e96304'
  '5f32a7baef326d88754c6581883800a8d68a753bec846a1d0c190460ab7a2424'
)

build() {
  cd "$srcdir"
  msg "Extracting..."
  tar xf data.tar.xz
  msg2 "Done extracting!"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
