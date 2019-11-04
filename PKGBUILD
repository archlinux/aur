# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Otto Sabart <seberm[at]seberm[dot]com>
# Contributor: Mizuchi <ytj000+AUR@gmail.com>
# Contributor: Veli-Jussi Raitila <vjr AT iki DOT fi>

pkgname=python-pysrt
pkgver=1.1.1
pkgrel=5
pkgdesc="Python parser for SubRip (srt) files"
arch=('any')
url="https://github.com/byroot/pysrt"
license=('GPL3')
depends=('python-chardet')
optdepends=('python-setuptools: for srt script')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/byroot/pysrt/archive/v$pkgver.tar.gz")
sha512sums=('91f4eb3b76aeb9eb3a9f6fa8c2a524c8e63b43adb5bd7424f4de7bef2f167967b7de9615eca28905516764f060cb04faae40f59964f5933ff78e6f4b8a7648ca')

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
