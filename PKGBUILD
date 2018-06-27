# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=dnsmorph
pkgver=1.2.2
pkgrel=1
pkgdesc='Domain name permutation engine written in Go'
arch=('any')
url='https://github.com/netevert/dnsmorph'
license=('MIT')
makedepends=('go')
source=("https://github.com/netevert/${pkgname}/archive/v.${pkgver}.tar.gz")
sha256sums=('1b581fe550a95a0ee47f145bed5554f35e9f01f234895eeaa7c789294a1dd743')

build() {
  export GOPATH="${srcdir}"
  mkdir -p "${srcdir}/src/github.com/netevert"
  ln -fsT "${srcdir}/${pkgname}-v.${pkgver}" "${srcdir}/src/github.com/netevert/${pkgname}"
  cd "${srcdir}/src/github.com/netevert/${pkgname}"
  go get -v ./...
}

package() {
  # binary
  install -Dm755 bin/dnsmorph "${pkgdir}/usr/bin/dnsmorph"
}
