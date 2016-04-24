# Maintainer: aksr <aksr at t-com dot me>
pkgname=v6shell-git
pkgver=4.2.0.r3.gc2c95b6
pkgrel=1
epoch=
pkgdesc="V6 Thompson Shell Port"
arch=('i686' 'x86_64')
url="http://v6shell.org/"
url="https://github.com/JNeitzel/v6shell"
license=('custom')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git://github.com/JNeitzel/v6shell.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr LIBEXECDIR=/usr/bin install
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

