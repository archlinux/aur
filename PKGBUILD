# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=screamingfrogseospider
pkgver=18.1
pkgrel=1
pkgdesc="A small desktop program you can install on your PC or Mac which spiders websites’ links, images, CSS, script and apps from an SEO perspective."
arch=('x86_64' 'i686')
url="https://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
depends=()
makedepends=('tar')
source=(
  "screamingfrogseospider_${pkgver}_all.deb::https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_all.deb?noredirect"
  "LICENSE"
)
sha256sums=('2ea7c22d743bdf6c3c2e54135d3993c993e85660205961bf8acfc1270640abe6'
            '855f01069c19bb605e344fb9e42ca63caeeb2c214c4be04ad4990a749f3cf069')

build() {
  msg "Extracting deb data..."
  tar xf "$srcdir/data.tar.xz" -C "$srcdir"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$srcdir/usr/share/${pkgname}/jre/bin/java" "$pkgdir/usr/share/${pkgname}/jre/bin/java"
}

# vim:set ts=2 sw=2 et:
