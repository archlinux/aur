# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Dmitry Batenkov <dima dot batenkov at gmail dot com>

pkgname=thunarx-python
epoch=1
pkgver=0.5.2
pkgrel=2
pkgdesc="Thunarx Python Bindings"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://goodies.xfce.org/projects/bindings/thunarx-python'
depends=('thunar>=1.7.0' 'python-gobject')
provides=("python-thunarx=${pkgver}")
conflicts=('python-thunarx')
replaces=('python-thunarx')
license=('GPL')
sha256sums=('96da0bb7c6ccf1783bfd91a1cfb5071e2e19cc45038b77bd13ca00d0f74d9f22')
source=("https://archive.xfce.org/src/bindings/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
