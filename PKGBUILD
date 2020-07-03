# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Pawel "kTT" Salata <rockplayer.pl@gmail.com>

pkgname=('python2-pycountry')
_name=${pkgname#python2-}
pkgver=20.7.3
pkgrel=1
pkgdesc="ISO country, subdivision, language, currency and script definitions and their translations"
arch=('any')
url="https://pypi.org/project/pycountry/"
license=('LGPL2.1')
makedepends=('python2' 'python2-setuptools')
checkdepends=('python2-pytest' 'python2-pytest-runner')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('df88a34307a4275267a7f3af282b73ca5e762c49ad158bfcd39b97c5d852bf045bcfe72351fc6f232c55003a7c4b0a04801eb562ba65ed5d599bd45b2bd3bc58')

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
