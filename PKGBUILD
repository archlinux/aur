pkgname=beanstool-git
pkgver=v0.2.0.r0.g18464dc
pkgrel=2
epoch=
pkgdesc=""
arch=('i686' 'x86_64')
url=""
license=('GPL')
groups=()
depends=()
makedepends=('go')
checkdepends=()
optdepends=()
provides=('beanstool')
conflicts=('beanstool')
source=("git+https://github.com/tyba/beanstool.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/beanstool"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "$srcdir/beanstool"
}

build() {
  cd "$srcdir/beanstool"
  mkdir -p "$srcdir/go"
  export  GOPATH="$srcdir/go"
  go get gopkg.in/check.v1
  make build
}

check() {
  cd "$srcdir/beanstool"

}

package() {
  cd "$srcdir/beanstool"
  export  GOPATH="$srcdir/go"
  install -D -m755 "beanstool" "${pkgdir}/usr/bin/beanstool"
  
}

# vim:set ts=2 sw=2 et:
