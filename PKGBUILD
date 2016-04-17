# Maintainer: buckket <buckket@cock.li>

pkgname=("python-spotify" "python2-spotify")
_pkgname=pyspotify
pkgver=2.0.5
pkgrel=4
pkgdesc="A Python wrapper for libspotify."
arch=("i686" "x86_64")
license=("APACHE")
url="http://pyspotify.mopidy.com/"
makedepends=("python-setuptools" "python2-setuptools")
conflicts=("python2-pyspotify" "pyspotify")
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('fbd41c58d62232b0cabb7a9e38d45f36ac221699c006899bdb6be74c04602678')

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
  depends=("libspotify" "python-cffi")
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-spotify() {
  depends=("libspotify" "python2-cffi")
  cd ${pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

