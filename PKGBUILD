# Maintainer: Kai <kai@example.com>
pkgname=mineplacktodo
pkgver=1.0.0
pkgrel=1
pkgdesc="Mineplack ToDo app"
arch=('x86_64')
url="https://github.com/wizardstream/MineplackToDo"
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("https://github.com/wizardstream/MineplackToDo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5d3fa356a679c4f1ac4f1e697f750a7acaa4de2ce376146a60f0aa3dca468fc7') # Replace with actual checksum for production

build() {
  cd "${srcdir}/MineplackToDo-${pkgver}"
  go build -o mineplacktodo
}

package() {
  cd "${srcdir}/MineplackToDo-${pkgver}"
  install -Dm755 mineplacktodo "$pkgdir/usr/bin/mineplacktodo"
}
