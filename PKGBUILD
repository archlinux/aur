# Maintainer: aksr <aksr at t-com dot me>
_pkgname=fmt
pkgname=neatfmt
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A small utf-8 unix fmt(1) clone (not completely compatible though)."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('custom:BSD')
categories=()
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://litcave.rudi.ir/${_pkgname}.tar.gz")
noextract=()
options=()
md5sums=('416462bc06dbd60b2a7a4e868dec4181')
sha1sums=('bd0f2f074100812ea9eb5008321a192fa71a8205')
sha256sums=('c4562fb0497874619b515a25cfd6f04aee4cc70b183a724c363141e5892e797a')

build() {
  cd "$srcdir/$_pkgname"
  make CC=gcc
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 fmt $pkgdir/usr/bin/neatfmt
  sed '1,7!d' fmt.c > LICENSE
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

