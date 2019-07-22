# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Pawel "kTT" Salata <rockplayer.pl@gmail.com>

pkgname=('python2-pycountry')
_name=${pkgname#python2-}
pkgver=19.7.15
pkgrel=1
pkgdesc="ISO country, subdivision, language, currency and script definitions and their translations"
arch=('any')
url="https://pypi.org/project/pycountry/"
license=('LGPL2.1')
makedepends=('python2' 'python2-setuptools')
checkdepends=('python2-pytest' 'python2-pytest-runner')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('504ddf66747817a0bf7f9420e541c5589e3dacf818095af0b9de7ffdb66040345445900009349d5564647d33ec6941090aadbdc5931160314f621935d2556d99')

build(){
  cd "${srcdir}/pycountry-${pkgver}"
  python2 setup.py build
}

check(){
  cd "${srcdir}/pycountry-${pkgver}"
  python2 setup.py pytest
}

package_python2-pycountry() {
  depends=('python2'
           'python2-lxml')
  cd "${srcdir}/pycountry-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
