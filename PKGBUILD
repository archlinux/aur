# Maintainer: Enzzo Cavallo <souenzzo at gmail dot com>
pkgname=datomic-cli
pkgver=0.10.82
pkgrel=1
pkgdesc="Command line tools for datomic cloud"
arch=('any')
url="https://docs.datomic.com/cloud/releases.html"
license=('custom')
depends=('aws-cli' 'clojure')
_bins=('datomic' 'datomic-access' 'datomic-analytics' 'datomic-gateway')

source=("https://datomic-releases-1fc2183a.s3.amazonaws.com/tools/$pkgname/$pkgname-$pkgver.zip")
md5sums=('f94da5e1856a97f3abc4f8fc334b480a')

package() {
  for bin in "${_bins[@]}"; do
    install -Dm755 "$srcdir/$pkgname/$bin" "$pkgdir/usr/bin/$bin"
  done
}

