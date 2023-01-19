# Maintainer: gabrielzschmitz <gabrielzschmitz@protonmail.com>
pkgname='tomato.c-git'
pkgver=r135.d0ee8cc
pkgrel=1
pkgdesc="A pomodoro timer written in pure C"
arch=('x86_64')
url="https://github.com/gabrielzschmitz/Tomato.C.git"
license=('GPL3')
depends=('libnotify' 'mpv')
makedepends=('gcc' 'ncurses' 'pkgconf' 'git')
provides=('tomato')
conflict=('tomato')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd Tomato.C
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd Tomato.C
    make
}

package() {
    cd Tomato.C
    sudo make install
}

