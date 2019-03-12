# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-gluonnlp
pkgver=0.5.0
pkgrel=1
pkgdesc='A toolkit for Natural Language Processing (NLP) research'
arch=(any)
url=https://gluon-cv.mxnet.io
license=('Apache')
depends=(mxnet python-numpy python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-nose python-pytest python-scipy)
optdepends=(python-jieba python-nltk)
source=("gluon-nlp-$pkgver.tar.gz"::"https://github.com/dmlc/gluon-nlp/archive/v$pkgver.tar.gz")
sha512sums=('10f81405ae1e00f2c0f59e347a14daf8a9a1860601e687b1e0342f984b61767170c089b392ea2a454aaf1a544600a2fe3f3eb90f6b534a6fd29dfe2040a4f280')

build() {
  cd gluon-nlp-$pkgver
  python setup.py build
}

#check() {
#  cd gluon-nlp-$pkgver
#  pytest -v
#}

package() {
  cd gluon-nlp-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
