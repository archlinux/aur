# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=martin-todo-git
pkgver=r13.7dce80e
pkgrel=1
pkgdesc='Extremely simple todo app because everything sucks'
arch=('x86_64' 'i686')
url='https://github.com/sandsmark/martin-todo.git'
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
conflicts=(martin-todo)
provides=(martin-todo)
source=('git+https://github.com/sandsmark/martin-todo.git')
md5sums=('SKIP')

pkgver() {
    cd martin-todo
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd martin-todo
    qmake
    make
}


package() {
    cd martin-todo
    make INSTALL_ROOT="$pkgdir" install
}
