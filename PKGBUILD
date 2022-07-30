# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

_base=rabbitpy
pkgname=python2-${_base}
pkgver=2.0.1
pkgrel=1
pkgdesc="A pure python, thread-safe, minimalistic and pythonic RabbitMQ client library"
arch=(any)
url="https://github.com/gmr/${_base}"
depends=(python2) # -pamqp
makedepends=(python2-setuptools)
license=('custom')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('b0ff11d7e2c063db654d2668178101eedc4ff3e3b609a5615e4876eda82491260d74da11d5c892721b6d7f6947efabe0a9f7875992f84c1fcd0e51478bb88f56')

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
