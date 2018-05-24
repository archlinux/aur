# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

pkgname=python2-modargs
_name=python-${pkgname#python2-}
pkgver=1.7
pkgrel=1
pkgdesc="Modargs is a simple command line argument parsing library that infers arguments from functions in a module."
arch=('any')
url="https://pypi.python.org/pypi/python-modargs"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "LICENSE::https://gitorious.org/python-modargs/python-modargs.git/?p=python-modargs:python-modargs.git;a=blob_plain;f=LICENSE;h=f59ac9a1152892dc4aaba5a0eb55a64023fd6bc3;hb=HEAD")
sha256sums=('90b4b18fa5898f524740add9f0a1fde6fed7745aa9dffdaa5d7b439314e9dc3a'
          'e290d9ba8d6863d839d71b62412f79bd45714ba6986d641957ac955f23a0d57f')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 ${srcdir}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
