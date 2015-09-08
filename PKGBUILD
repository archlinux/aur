# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=upass
_pyname=upass
pkgver=0.1.3
pkgrel=1
pkgdesc='Console UI for pass'
arch=('any')
url='https://github.com/Kwpolska/upass'
license=('BSD')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('8537c7f07058b697c73d9754f24b49c3')
depends=('pass' 'python' 'python-setuptools' 'python-urwid' 'python-pyperclip')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
}

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
