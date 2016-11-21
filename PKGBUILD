# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=easyexif
pkgver=1.0.0
pkgrel=1
pkgdesc="Tiny ISO-compliant C++ EXIF parsing library, third-party dependency free."
arch=('i686' 'x86_64')
url="https://github.com/mayanklahiri/easyexif"
license=('BSD-2-Clause')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/mayanklahiri/$pkgname.git")
noextract=()
md5sums=('SKIP')

build()
{
    cd $pkgname
    make
    ar rcs easyexif.a exif.o
}

package()
{
    cd $pkgname


    if [ "$CARCH" -eq "i686" ]; then
        mkdir -p $pkgdir/usr/lib32
        cp easyexif.a $pkgdir/usr/lib32/
    else
        mkdir -p $pkgdir/usr/lib64
        cp easyexif.a $pkgdir/usr/lib64/
    fi

    mkdir -p $pkgdir/usr/include
    cp exif.h $pkgdir/usr/include/
}
