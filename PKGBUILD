# Maintainer: Julian Brost <julian@0x4a42.net>
# Contributor: Andrew Crerar <crerar@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=python2-psycopg2
pkgver=2.8.6
pkgrel=4
pkgdesc="A PostgreSQL database adapter for the Python programming language."
arch=('x86_64')
url="http://initd.org/psycopg/"
license=('LGPL3')
depends=('python2' 'postgresql-libs')
makedepends=('python2-setuptools')
source=(http://initd.org/psycopg/tarballs/PSYCOPG-2-8/psycopg2-$pkgver.tar.gz{,.asc})
validpgpkeys=('8AD609956CF1899418E19A856013BD3AFCF957DE')
sha512sums=('1e1d5d8755c6d1a153d84210bf29902afafe853659d709e13abc6bc5772def13779d2394690af1c544384c9c607edc0fe5cf2763244fb346febf9a9e0032b45f'
            'SKIP')

build(){
  cd "psycopg2-$pkgver"
  sed -i 's/,PSYCOPG_DEBUG$//' setup.cfg
  python2 setup.py build
}

package() {
  cd "psycopg2-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

