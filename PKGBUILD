# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Otto Sabart <seberm[at]seberm[dot]com>
# Contributor: Mizuchi <ytj000+AUR@gmail.com>
# Contributor: Veli-Jussi Raitila <vjr AT iki DOT fi>

pkgname=python-pysrt
pkgver=1.1.2
pkgrel=2
pkgdesc="Python parser for SubRip (srt) files"
arch=('any')
url="https://github.com/byroot/pysrt"
license=('GPL3')
depends=('python-chardet')
optdepends=('python-setuptools: for srt script')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/byroot/pysrt/archive/v$pkgver.tar.gz")
sha512sums=('0d6b3a7ce4c8733221bfb5c3e434233d1b221fedda3c145fafe124093f1f9090b99c175e79de386717ec5f8b564c62719f377651db95a8d3c382e2bf8dccb0a8')

build() {
  cd pysrt-$pkgver
  python setup.py build
}

check() {
  cd pysrt-$pkgver
  nosetests3
}

package() {
  cd pysrt-$pkgver  
  python setup.py install --root="$pkgdir" --optimize=1
}
