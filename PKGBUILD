# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Pawel "kTT" Salata <rockplayer.pl@gmail.com>

pkgname=('python2-pycountry')
_name=${pkgname#python2-}
pkgver=20.7.2
pkgrel=1
pkgdesc="ISO country, subdivision, language, currency and script definitions and their translations"
arch=('any')
url="https://pypi.org/project/pycountry/"
license=('LGPL2.1')
makedepends=('python2' 'python2-setuptools')
checkdepends=('python2-pytest' 'python2-pytest-runner')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('2de04812a8fc738e8aed6b3d23bfefa1585a534594427fb6c2dd54e6eebbfa8a6c21c20cd5dcca052d8e5fb59071dabffbfa508db4ff65b3af499db61f48ec29')

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
