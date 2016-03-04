# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=go-gojsonschema
pkgver=349.3988ac1
pkgrel=1
pkgdesc="Go implementation of JSON Schema, based on IETF's draft v4"
arch=('x86_64' 'i686')
url="https://github.com/xeipuuv/gojsonschema"
license=('Apache')
depends=('go')
makedepends=('rsync')
options=('!strip' '!emptydirs')
_gourl='github.com/xeipuuv/gojsonschema'

build() {
  GOPATH="${srcdir}" go get -v -x ${_gourl}
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/lib/go"
  rsync -avz --exclude .git {src,pkg} "${pkgdir}/usr/lib/go"
}
