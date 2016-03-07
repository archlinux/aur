# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Otto Sabart <seberm[at]seberm[dot]com>
# Contributor: Mizuchi <ytj000+AUR@gmail.com>
# Contributor: Veli-Jussi Raitila <vjr AT iki DOT fi>

pkgbase=python-pysrt
pkgname=(python-pysrt python2-pysrt)
pkgver=1.1.0
pkgrel=1
pkgdesc="Python parser for SubRip (srt) files"
arch=('any')
url="https://github.com/byroot/pysrt"
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools' 'python-chardet' 'python2-chardet')
source=("https://pypi.python.org/packages/source/p/pysrt/pysrt-${pkgver}.tar.gz")
md5sums=('223da1e3bc9a67de1a2e3cfaa7d9264d')

prepare() {
  cp -a pysrt-$pkgver{,-py2}
}

package_python-pysrt() {
  depends=('python-chardet')

  cd pysrt-$pkgver  
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pysrt() {
  depends=('python2-chardet')

  cd pysrt-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir/usr/bin/srt"{,2}
}
