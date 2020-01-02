# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>
pkgbase='python-nine'
_pkgbase="${pkgbase#python-}"
pkgname=('python-nine')
pkgver=1.0.0
pkgrel=7
arch=('any')
pkgdesc="Python 3/2 compatibility library, allowing to add py2 compat to py3 code"
url="https://github.com/nandoflorestan/nine/"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/nandoflorestan/nine/archive/v${pkgver}.tar.gz")
sha512sums=('371f7d9dbfd14bc0f81c9c734e8c3f133e3ccd8a3571d0ef2edbc9532a8d0c47cf29ceaa8bcd9e095e098e547abc329a787e43ba3bf6b0f99b8df0a89755cd52')

check() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python ./setup.py test
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python ./setup.py install --root="$pkgdir/" --optimize=1
  install -D -m0644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
