pkgname=text-editor
pkgver=0.1
pkgrel=1
pkgdesc="Simple terminal based text editor"
arch=(x86_64)
url="https://github.com/Student-Team-Projects/Text-Editor"
license=('MIT')
depends=('ncurses'  'gpm' 'glibc') 
makedepends=('git' 'make' 'gcc>=10' 'cmake')
source=("git+$url")
sha256sums=('SKIP')  


prepare() {
    git submodule update --force --init --recursive
}

build() {

    a=$PWD
    cd ${srcdir}/Text-Editor
    git submodule update --force --init --recursive
    ./build.sh
    cd $a
}

package() {
    install -Dm755 "${srcdir}/Text-Editor/build/text-editor" "${pkgdir}/usr/bin/text-editor"
}

