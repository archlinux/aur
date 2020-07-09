# Maintainer: buckket <felix@buckket.org>

pkgname=("python-spotify" "python2-spotify")
_pkgname=pyspotify
pkgver=2.1.3
pkgrel=1
pkgdesc="A Python wrapper for libspotify."
arch=("i686" "x86_64")
license=("APACHE")
url="http://pyspotify.mopidy.com/"
depends=("libspotify")
makedepends=("python-setuptools" "python2-setuptools")
conflicts=("python2-pyspotify" "pyspotify")
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6ae31d8ccd7e1f138a80f08c766173b2ced12d196732f68aee4ae023b7a9ad2a')

prepare() {
  cp -r ${_pkgname}-${pkgver} "python-spotify-${pkgver}"
  cp -r ${_pkgname}-${pkgver} "python2-spotify-${pkgver}"
}

build_python-spotify() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

build_python2-spotify() {
  cd ${pkgname}-${pkgver}
  python2 setup.py build
}

package_python-spotify() {
  depends=("python-cffi")
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-spotify() {
  depends=("python2-cffi")
  cd ${pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

