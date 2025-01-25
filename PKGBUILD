# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=spdx-license-list-data
pkgver=3.26.0
pkgrel=1
pkgdesc='Various data formats for the SPDX License List including RDFa, HTML, Text, and JSON'
url='https://spdx.github.io/license-list-data/'
license=('CC0-1.0')
arch=('any')

source=("$pkgname-$pkgver.tar.gz::https://github.com/spdx/license-list-data/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('71eb720dffab6a8fd7a0d61f38bf6e8b4ce72cf05e6d21e7be34b8a47a16cd62')
b2sums=('e6bf3dc7ecce1747aa8cc04488b6748ea3212d6311ad0ff9d6a178cb1db3e8dd349e67f91fa2cbefe6dfa4566bac0fcf1a45152cc40b6fd696cdb3432587823f')

package() {
  cd "license-list-data-$pkgver"

  install -dm0755 "$pkgdir/usr/share/spdx/license-list-data"

  for ty in text json template html; do
    cp -ar $ty "$pkgdir/usr/share/spdx/license-list-data/$ty"
  done
}
