# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Pawel "kTT" Salata <rockplayer.pl@gmail.com>

pkgname=('python2-pycountry')
_name=${pkgname#python2-}
pkgver=19.8.18
pkgrel=1
pkgdesc="ISO country, subdivision, language, currency and script definitions and their translations"
arch=('any')
url="https://pypi.org/project/pycountry/"
license=('LGPL2.1')
makedepends=('python2' 'python2-setuptools')
checkdepends=('python2-pytest' 'python2-pytest-runner')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('39ba06629eeea55460424d06992ca5f1e5bf6168b219dc4880ec326f6aa0c92a4fdc54d4143a8b8bb1490149af793e760e291c6d704104a57ba91e88228ab669')

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
