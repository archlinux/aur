# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.maRS<leemars at gmail.com>
# Contributor: Kerrick Staley <mail at kerrickstaley.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ibus-pinyin
pkgver=1.5.0
pkgrel=1
pkgdesc='Pinyin (Chinese) input method for the IBus framework'
arch=('i686' 'x86_64')
license=('GPL')
url='http://ibus.googlecode.com'
depends=('ibus' 'pyzy' 'lua51')
makedepends=('intltool')
source=("https://ibus.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e "s|python|python2|" setup/ibus-setup-pinyin.in

  PYTHON=python2 ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make NO_INDEX=true DESTDIR="${pkgdir}" install
}
md5sums=('f7728b5b785fae58e2b4de8dfda45612')
