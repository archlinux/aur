# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Hugo Doria <hugo@archlinux.org>
# Contributor: N3RD3X <n3rd3x@linuxmail.org>

pkgname=python2-gnutls
pkgver=3.1.2
pkgrel=1
pkgdesc="Python wrapper for the GNUTLS library"
arch=('any')
url="https://cheeseshop.python.org/pypi/python-gnutls"
depends=('python2' 'gnutls' 'libgcrypt')
license=('LGPL')
source=(https://pypi.python.org/packages/source/p/python-gnutls/python-gnutls-${pkgver}.tar.gz
	libraryinit.patch
	libraryfunctions.patch)
sha256sums=('28748e02a8035c31826152944e41217ebcc58ab7793ae5a22850cd23d3cfbbbe'
            'd288e90fae55652aada402a4e3c60b797df01a0da6ecc500a3a26b903c821d2b'
            '8443ae32fdbfc4c1880bf5e1a1d9cc71077d6ee5c5d52f01a9c9c4c291ae64d9')

prepare() {
  cd "$srcdir"/python-gnutls-${pkgver}
#  patch -p1 <"$srcdir"/libraryinit.patch
#  patch -p1 <"$srcdir"/libraryfunctions.patch
}

package() {
  cd "$srcdir"/python-gnutls-${pkgver}
  python2 setup.py install --root="$pkgdir"
}
