# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=spdx-license-list-data
pkgver=3.29.0
pkgrel=1
pkgdesc='Various data formats for the SPDX License List including RDFa, HTML, Text, and JSON'
url='https://spdx.github.io/license-list-data/'
license=('CC0-1.0')
arch=('any')

source=("$pkgname-$pkgver.tar.gz::https://github.com/spdx/license-list-data/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d69195f5b11d4b84ffccd12d943e90732694d00fea42dc81fcc66f79d6cc8104')
b2sums=('0a0a34fe49e7065324ded55d9f6204c4354e18489c32a7e7572670fb1096cabb2d2dd133c3e18c1fad35e1766d7cd6cc27070e13137d6a49a355d899ba6c5c3f')

package() {
  cd "license-list-data-$pkgver"

  install -dm0755 "$pkgdir/usr/share/spdx/license-list-data"

  for ty in text json template html; do
    cp -ar $ty "$pkgdir/usr/share/spdx/license-list-data/$ty"
  done
}
