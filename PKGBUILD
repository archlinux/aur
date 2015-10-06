# Maintainer: aksr <aksr at t-com dot me>
pkgname=metamath
pkgver=0.118
pkgrel=1
epoch=
pkgdesc="A tiny language that can express theorems in abstract mathematics, accompanied by proofs that can be verified."
arch=('i686' 'x86_64')
url="http://us.metamath.org/"
license=('GPLv2')
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
install=echo.install
changelog=
source=("http://us.metamath.org/downloads/$pkgname.tar.gz"
        "echo.install")
noextract=()
options=()
md5sums=('4e4854a5a6af74a7d48a33ece88e87b8'
         'd0f457c0a059cc589b214845fa02571a')
sha1sums=('c5c13fcba2be0747097fcfa3f437c6ff2855f999'
          '5f1411db226c0d6c11dfc8653afb773ec802c610')
sha256sums=('6ba559e54396c99443c222a2efdb013c47524c8f9d98a6088992847e4cb273a1'
            'a4c1862b2644e8c68980eb558e23108362331d3cd25933800b8d506e52d815d6')

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname"
  make -k check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 README.TXT $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

