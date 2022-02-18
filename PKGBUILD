#Maintainer issue <issue at archlinux dot info>

pkgname=ntrviewer-git
_pkgname=NTRViewer
pkgdesc=" PC Viewer for NTR CFW's streaming feature"
url="https://github.com/44670/NTRViewer"
pkgrel=3
depends=('sdl' 'libjpeg-turbo' 'ffmpeg' 'sdl2')
makedepends=('git' 'make')
arch=('x86_64')
license=('GPL3')
md5sums=('SKIP')
pkgver=r9.e780deb
source=('git+https://github.com/44670/NTRViewer.git')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
}

build(){
    cd $_pkgname

    make CONF=Debug
}

package(){
    install -Dm755 "$srcdir/$_pkgname/dist/Debug/GNU-Linux/ntrviewer" "$pkgdir/usr/bin/ntrviewer"
}

