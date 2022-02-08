# Contributor: Bidossessi Sodonon <bidossessi@linuxbenin.com>
_base=jcconv
pkgname=python2-${_base}
pkgver=0.2.3
pkgrel=2
pkgdesc="JapaneseCharacterCONVerter, interconvert hiragana, katakana, halfwidth kana"
url="https://github.com/taichino/${_base}"
arch=(any)
license=(MIT)
depends=(python2)
makedepends=(python2-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('06be79f8f37fe378f2fcf4b770247c47e79e60972317c1fec7868b6dd5a0ff220d77a220523fdf4bf67c59b83ce2d2efb7810409f57dbc361a5b1ecd7e314829')

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
