# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=dnss-git
pkgver=2020.11.19
pkgrel=1
pkgdesc="DNSS is a daemon for using DNS over HTTPS"
arch=(any)
url="https://github.com/albertito/dnss"
license=('Apache-2.0')
makedepends=('go' 'git')
conflicts=('dnss')
provides=('dnss')

prepare() {
  git clone --single-branch --no-tags --branch master https://github.com/albertito/dnss dnss-git
}

build() {
  cd dnss-git
  go build blitiri.com.ar/go/dnss
}

package() {
  install -Dvm755 "${pkgname}/dnss" -t "${pkgdir}/usr/bin"
}
