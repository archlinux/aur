# Maintainer: Gore Liu <goreliu@126.com>

pkgname=python-lolcat
_realname=lolcat
pkgver=0.44
pkgrel=2
pkgdesc="Rainbows and unicorns (without Ruby! jay!)"
url="https://github.com/tehmaze/lolcat"
arch=('any')
license=('beerware')
depends=('python-setuptools')
conflicts=('lolcat')
source=("https://github.com/tehmaze/${_realname}/archive/${pkgver}.tar.gz")
md5sums=('1688c1987087eb7bc55ad70e0fd91c25')

build() {
  cd "${srcdir}"/"${_realname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}"/"${_realname}-${pkgver}"
  LC_CTYPE=en_US.UTF-8 python setup.py test
}

package() {
  cd "${srcdir}"/"${_realname}-${pkgver}"
  python setup.py install --root="$pkgdir"
}
