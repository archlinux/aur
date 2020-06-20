# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=slingr-git
pkgver=r44.bf1de3d
pkgrel=1
pkgdesc='A simple CLI for UPnP media file streaming'
arch=('i686' 'x86_64')
url='https://github.com/yuvadm/slingr'
license=('GPL3')
provides=('slingr')
depends=('gcc-libs')
makedepends=('cargo')
source=("slingr::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/slingr"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd slingr
  cargo build --release
}

package() {
  cd slingr
  install -Dm755 target/release/slingr -t "$pkgdir"/usr/bin
}