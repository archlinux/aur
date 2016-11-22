# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python2-doit
_pyname=doit
pkgver=0.29.0
pkgrel=3
pkgdesc='doit automation tool'
arch=('any')
url='http://pydoit.org/'
license=('MIT')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
depends=('python2' 'python2-pyinotify' 'python2-six' 'python2-setuptools' 'python2-cloudpickle')
md5sums=('9968e1a669bad0a999212ab9f5c591a3')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
