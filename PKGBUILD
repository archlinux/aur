# Maintainer: aksr <aksr at t-com dot me>
pkgname=irssi-plugin-otr-git
pkgver=1.0.1.r15.gf75eb26
pkgrel=1
pkgdesc="LibOTR functionality in Irssi."
arch=('i686' 'x86_64')
url="https://github.com/cryptodotis/irssi-otr"
license=('GPLv2')
groups=()
depends=('irssi' 'libotr')
makedepends=('git')
provides=('irssi-otr')
conflicts=('irssi-otr' 'irssi-otr-git')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git://github.com/cryptodotis/irssi-otr.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  git describe --long | sed -E 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$pkgname
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

