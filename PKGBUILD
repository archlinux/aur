# Maintainer: aksr <aksr at t-com dot me>
pkgname=metamath
pkgver=0.109
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
md5sums=('e7497eccb7b2218744c0342f314b1e28'
         '9e3bb33b1840614bcba783934099dbb7')
sha1sums=('9de9131eea6e9b3328c232cde9d02106591ba6e4'
          '679efde646ac3e8335b16f09ae9def9a08ffdf1f')
sha256sums=('bfe9183bb52151211474dc17190ddd75f9b26b0832bc1f778a82c5ce28a85195'
            '743d54a6918af23e032238feab19239b95a9ea34a012b6b7ba23ae97729c2f26')

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
  install -Dm644 README.TXT  $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

