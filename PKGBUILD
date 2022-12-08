# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
pkgname=python-autosub1
_name=${pkgname#python-}
pkgver=0.4.7
pkgrel=1
pkgdesc='Auto-generates subtitles for any video or audio file'
arch=(any)
url=https://pypi.org/project/autosub1
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7fe8a351de227ec46b768b2b92ff0fa01cedbfe83a9fe1800fa183ff9356e3e0')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
