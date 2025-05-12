# Maintainer: Paul Black <paul@blackfamily.one>

pkgname=si-edit-git
pkgver=0.0.129
pkgrel=1
pkgdesc="Tools for working with SI files from LEGO Island."
arch=('i686' 'x86_64')
url="https://github.com/isledecomp/SIEdit"
license=('GPLv3')
depends=('qt6-base' 'qt6-tools' 'qt6-multimedia' 'ffmpeg' 'gcc')
makedepends=('git' 'make' 'cmake')
source=('git+https://github.com/isledecomp/SIEdit.git')
md5sums=('SKIP')

build() {
        cd "$srcdir/SIEdit"
        mkdir -p build
        cd build
        cmake ..
        make -j$(nproc)
}

package() {
        cd "$srcdir/SIEdit/build/app"
        install -Dm755 si-edit "$pkgdir/usr/bin/si-edit"
}
