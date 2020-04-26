# Maintainer: Gore Liu <goreliu@126.com>

pkgname=python-lolcat
_realname=lolcat
pkgver=1.4
pkgrel=1
pkgdesc="Rainbows and unicorns (without Ruby! jay!)"
url="https://github.com/tehmaze/lolcat"
arch=('any')
license=('beerware')
depends=('python-setuptools')
conflicts=('lolcat')
source=("https://github.com/tehmaze/${_realname}/archive/${pkgver}.tar.gz")
md5sums=('35bea13808a5edc51a7e70728e91a9e4')

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
