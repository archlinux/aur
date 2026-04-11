# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=spdx-license-list-data
pkgver=3.28.0
pkgrel=1
pkgdesc='Various data formats for the SPDX License List including RDFa, HTML, Text, and JSON'
url='https://spdx.github.io/license-list-data/'
license=('CC0-1.0')
arch=('any')

source=("$pkgname-$pkgver.tar.gz::https://github.com/spdx/license-list-data/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52375a91b28b5f6f3142c4b3a555086482f1e09be68c4fa7fdbf377d37afa340')
b2sums=('8d69628a747b894776e77e9cf05f2efaca71f35c18de5d22d31a60ae52426fb2fc0d3fb67e492919343328612ceccee41433f38826212628d35d33d9260d2647')

package() {
  cd "license-list-data-$pkgver"

  install -dm0755 "$pkgdir/usr/share/spdx/license-list-data"

  for ty in text json template html; do
    cp -ar $ty "$pkgdir/usr/share/spdx/license-list-data/$ty"
  done
}
