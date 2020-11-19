# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=dnss
pkgver=2020.11.19
pkgrel=1
pkgdesc="DNSS is a daemon for using DNS over HTTPS"
arch=(any)
url="https://github.com/albertito/dnss"
license=('Apache-2.0')
makedepends=(go)
conflicts=()

prepare() {
  git clone --single-branch --no-tags --branch master https://github.com/albertito/dnss
}

build() {
  cd dnss
  go build blitiri.com.ar/go/dnss
}

package() {
  sudo cp dnss/dnss /usr/local/bin/
  rm -rf dnss
}
