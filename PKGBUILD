# Maintainer: Paul Black <paul@blackfamily.one>

pkgname=si-edit-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Tools for working with SI files from LEGO Island."
arch=('i686' 'x86_64')
url="https://github.com/itsmattkc/SIEdit"
license=('GPLv3')
depends=('qt5-base' 'qt5-tools' 'qt5-multimedia' 'ffmpeg')
makedepends=('git' 'make' 'cmake')
source=('git+https://github.com/itsmattkc/SIEdit.git')
md5sums=('SKIP')

build() {
        cd "$srcdir/SIEdit"
        mkdir -p build
        cd build
        cmake ..
        make
}

package() {
        cd "$srcdir/SIEdit/build/app"
        install -Dm755 si-edit "$pkgdir/usr/bin/si-edit"
}
