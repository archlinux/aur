#Maintainer: Gryf <gryf.dev@gmail.com>

pkgname=arkscript
pkgver=3.1.3
pkgrel=1
epoch=
pkgdesc="A small, fast, functional scripting language"
arch=('x86_64')
url="https://arkscript-lang.dev/"
license=('MPL2')
groups=()
depends=('gcc>=9')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-v$pkgver.tar.gz"::"https://github.com/ArkScript-lang/Ark/releases/download/v$pkgver/linux-gcc-9.zip")
sha256sums=("SKIP")
validpgpkeys=()

package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib/std

    install -m644 $srcdir/lib/std/*.ark $pkgdir/usr/lib/std
    install -m644 $srcdir/lib/*.arkm $pkgdir/usr/lib
    install -m755 $srcdir/arkscript $pkgdir/usr/bin
    install -m755 $srcdir/libArkReactor.so $pkgdir/usr/lib
}

