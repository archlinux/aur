# Maintainer: Mineplack <mineplack@gmail.com>
pkgname=mineplacktodo
pkgver=1.2.0
pkgrel=1
pkgdesc="Mineplack ToDo app"
arch=('x86_64')
url="https://github.com/wizardstream/MineplackToDo"
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("https://github.com/wizardstream/MineplackToDo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f25a6280227ead0053780a5acce217fe0e3a0af5047ad2921407e89c86d7e5db')

build() {
  cd "${srcdir}/MineplackToDo-${pkgver}"
  go build -o mineplacktodo
}

package() {
  cd "${srcdir}/MineplackToDo-${pkgver}"
  install -Dm755 mineplacktodo "$pkgdir/usr/bin/mineplacktodo"
}
