# Contributor: Olivier Medoc <o_medoc@yahoo.fr>
_base=liblnk
pkgname=python2-${_base}
pkgver=20210417
pkgrel=1
pkgdesc="Library and tools to access the Windows Shortcut File (LNK) format"
url="https://github.com/libyal/${_base}"
arch=(any)
license=(LGPL)
depends=(python2)
makedepends=(python2-setuptools gcc)
source=(https://pypi.org/packages/source/${_base::1}/${_base}-python/${_base}-python-${pkgver}.tar.gz)
sha512sums=('d39d4225ee15da850a5b280a5483331a0d5772dbdfd815eee61b4dd29d6a27f10e2b8cad10e43224d790fa864c0512fce43725a7b8ccabc5ee8deb4705cfa2cb')

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
