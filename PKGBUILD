# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=mgw
pkgver=1.0.2
pkgrel=1
pkgdesc="Image viewer with tiny filters"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/mgw/"
license=('GPL')
depends=('libgnomeui' 'gtk2')
source=(http://sourceforge.net/projects/mgw/files/mgw/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('7a53de53a56d538112f38e75b06157b5f6c0ca4417af9d6ac177a33e2dd466ac')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr LIBS="-lm"
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
