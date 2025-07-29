# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=spdx-license-list-data
pkgver=3.27.0
pkgrel=1
pkgdesc='Various data formats for the SPDX License List including RDFa, HTML, Text, and JSON'
url='https://spdx.github.io/license-list-data/'
license=('CC0-1.0')
arch=('any')

source=("$pkgname-$pkgver.tar.gz::https://github.com/spdx/license-list-data/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7a1eade71449d2ff3ae42957452f6e3a660a3704b477d0e72afc2b43be94c907')
b2sums=('38e6890e33f2197a020d0153e9a24fce3f71f0dd0d4ae74aa4e72ce8e3458bf35e26a3903945d96d9256638a7ccf02af78c88265d144712e16d360c82044b8f2')

package() {
  cd "license-list-data-$pkgver"

  install -dm0755 "$pkgdir/usr/share/spdx/license-list-data"

  for ty in text json template html; do
    cp -ar $ty "$pkgdir/usr/share/spdx/license-list-data/$ty"
  done
}
