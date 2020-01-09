# Maintainer: Jelle van der Waa <jelle@archlinux.org>
pkgname=pyflame
pkgver=1.6.6
pkgrel=1
pkgdesc="A tool for generating flame graphs for Python (2) processes."
arch=('x86_64')
url="https://github.com/uber/pyflame"
license=('APACHE')
depends=('gcc-libs')
makedepends=('python')
checkdepends=('python-virtualenv')
conflicts=('pyflame-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/uber/pyflame/archive/v$pkgver.tar.gz")
sha256sums=('03723509c037a994585e81e4a9c6d8e4fed87b486e23edd8d355a7bcc009bf79')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$pkgname-$pkgver"
#  make check
}
