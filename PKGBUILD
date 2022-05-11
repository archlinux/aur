# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>

pkgname=tmux-mem-cpu-load
pkgver=3.6.0
pkgrel=1
pkgdesc='CPU, RAM, and load monitor for use with tmux'
arch=('x86_64' 'aarch64')
url='https://github.com/thewtex/tmux-mem-cpu-load'
license=('Apache')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d66a5f6074d85aec275ed46502bfa262b40349d02ee8fefa3dbb5d4bf7844dcbd2aecc6af9c7ad15f3ede601b73ca7125bc3515fab105ccb1cee66283a15afd4')

build() {
  cmake -S "${pkgname}-${pkgver}" -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make -C build
}

package() {
  make -C build install
}

