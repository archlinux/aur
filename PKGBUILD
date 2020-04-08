# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=slingr-git
pkgver=r44.bf1de3d
pkgrel=1
pkgdesc='A simple CLI for UPnP media file streaming'
arch=('i686' 'x86_64')
url='https://github.com/yuvadm/slingr'
license=('GPL-3.0')
provides=('slingr')
makedepends=('cargo')
source=("git+${url}")
md5sums=('SKIP')

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
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/slingr
}