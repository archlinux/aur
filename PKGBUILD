# Maintainer: Mineplack <mineplack@gmail.com>
pkgname=mineplacktodo
pkgver=1.1.0
pkgrel=1
pkgdesc="Mineplack ToDo app"
arch=('x86_64')
url="https://github.com/wizardstream/MineplackToDo"
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("https://github.com/wizardstream/MineplackToDo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('00c417af47c756e1d3a53e8124604a7e3e8b5f14c01ac3a1cd17e255596136fe')

build() {
  cd "${srcdir}/MineplackToDo-${pkgver}"
  go build -o mineplacktodo
}

package() {
  cd "${srcdir}/MineplackToDo-${pkgver}"
  install -Dm755 mineplacktodo "$pkgdir/usr/bin/mineplacktodo"
}
