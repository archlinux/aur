# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>

pkgname=tmux-mem-cpu-load
pkgver=3.8.0
pkgrel=1
pkgdesc='CPU, RAM, and load monitor for use with tmux'
arch=('x86_64' 'aarch64')
url='https://github.com/thewtex/tmux-mem-cpu-load'
license=('Apache')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d3a65c3a8da02f1841a62c104fb96a5e0b14fa8b0820384e4eb805d5263212a16717c0c09a67cb1eadbbbc54b1f09dd70d3bfff9a0092eb0d74c4238dccc7f4e')

build() {
  cmake -G Ninja -S "${pkgname}-${pkgver}" -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  ninja -C build
}

package() {
  ninja -C build install
}
