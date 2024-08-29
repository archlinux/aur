# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=spdx-license-list-data
pkgver=3.25.0
pkgrel=1
pkgdesc='Various data formats for the SPDX License List including RDFa, HTML, Text, and JSON'
url='https://spdx.github.io/license-list-data/'
license=('CC0-1.0')
arch=('any')

source=("$pkgname-$pkgver.tar.gz::https://github.com/spdx/license-list-data/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3114e9f3fbf27b9768a5fc2ab427e9bc4282d30fea0abc9272456d6abf26fae')
b2sums=('4b12db8ed07962f8685231994222fef9d51fa3cbe105b1d0974cfe7a918fb5b0cf030f848f487b0cc8f7b697794a57711cb283f7d77c3e8cc0485af0a3a56551')

package() {
  cd "license-list-data-$pkgver"

  install -dm0755 "$pkgdir/usr/share/spdx/license-list-data"

  for ty in text json template html; do
    cp -ar $ty "$pkgdir/usr/share/spdx/license-list-data/$ty"
  done
}
