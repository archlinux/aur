# Maintainer: Iwan Timmer <irtimmer at gmail dot com>

pkgname=k4dirstat
pkgver=2.7.8
_commit=3a4663ee20e7
pkgrel=1
pkgdesc="A graphical disk usage utility for KDE (KDE4 port)"
arch=('i686' 'x86_64')
url=('https://bitbucket.org/jeromerobert/k4dirstat')
license=('GPL')
depends=('kdebase-lib')
makedepends=('docbook-xsl' 'automoc4' 'git' 'cmake')
source=("https://bitbucket.org/jeromerobert/k4dirstat/get/k4dirstat-$pkgver.tar.bz2")
sha256sums=('b897780cf2d8984c83de270bd4dc9b4f0ffb7fc69cd3e52ed3457b7c97e59c8d')

build() {
  cd "${srcdir}/jeromerobert-k4dirstat-$_commit"
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "${srcdir}/jeromerobert-k4dirstat-$_commit"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/k4dirstat/LICENSE
}
