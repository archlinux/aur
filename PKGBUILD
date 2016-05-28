# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

_pkgname=modargs
pkgname=python2-${_pkgname}
pkgver=1.7
pkgrel=1
pkgdesc="Modargs is a simple command line argument parsing library that infers arguments from functions in a module."
url="http://pypi.python.org/pypi/python-modargs"
depends=('python2')
license=('BSD')
arch=('any')

source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE::https://www.gitorious.org/python-modargs/python-modargs.git/?p=python-modargs:python-modargs.git;a=blob_plain;f=LICENSE;h=f59ac9a1152892dc4aaba5a0eb55a64023fd6bc3;hb=HEAD")
sha1sums=('ace9bb2af4d6f62501792a3bc0fc39e60df02e2b'
          '7fffa2cb5532406c2c9f5dc54709475b7244cf85')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 ${srcdir}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

