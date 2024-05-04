# Maintainer: chaewon <64337177+authorisation@users.noreply.github.com>

pkgname=cobalt-cli-git
pkgver=r18.6bd4964
pkgrel=1
pkgdesc="Unofficial cobalt command line client made in go."
arch=(x86_64)
url="https://github.com/lostdusty/cobalt"
license=('MIT')
groups=()
makedepends=('git' 'go')
provides=(cobalt)
source=("git+https://github.com/lostdusty/cobalt")
md5sums=('SKIP')

prepare() {
    cd cobalt

    go mod tidy
}

function pkgver() {
  cd cobalt

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd cobalt

  go build
}

package() {
  cd cobalt
  
  install -Dm755 cobalt "$pkgdir/usr/bin/cobalt"
}

