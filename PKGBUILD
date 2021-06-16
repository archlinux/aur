# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=dnss-git
pkgver=r130.1cf832b
pkgrel=1
pkgdesc="DNSS is a daemon for using DNS over HTTPS"
arch=(any)
url="https://github.com/albertito/dnss"
license=('Apache-2.0')
makedepends=('go' 'git')
conflicts=('dnss')
provides=('dnss')
source=("git+https://github.com/albertito/dnss.git")
_gitdir=dnss
sha256sums=('SKIP')

pkgver() {
  cd ${_gitdir}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_gitdir}
  go build blitiri.com.ar/go/dnss
}

package() {
  install -Dvm755 "${_gitdir}/dnss" -t "${pkgdir}/usr/bin"
}
