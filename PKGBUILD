# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='c94e9ccd04047f5461e155c54907feaa2e14035a'
pkgname=lesspassgo
pkgver=2017.06.09
pkgrel=1
pkgdesc='LessPass password generator cli written in Go'
arch=('any')
url='https://github.com/tuxlinuxien/lesspassgo'
license=('MIT')
makedepends=('go')
source=("https://github.com/tuxlinuxien/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('53e04f19e6576fbf4db132d1beaf600ce4ba3d365c9e11aa73d006bd67f15ef4')

build() {
  export GOPATH="${srcdir}"
  mkdir -p "${srcdir}/src/github.com/tuxlinuxien"
  ln -fsT "${srcdir}/${pkgname}-${_commit}" "${srcdir}/src/github.com/tuxlinuxien/${pkgname}"
  cd "${srcdir}/src/github.com/tuxlinuxien/${pkgname}/cmd/lesspassgo"
  go get -v ./...
}

package() {
  # binary
  install -D -m755 bin/lesspassgo "${pkgdir}/usr/bin/lesspassgo"
}
