# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python2-natsort
_pyname=natsort
pkgver=3.5.5
pkgrel=1
pkgdesc='Sort lists naturally.'
arch=('any')
url='https://github.com/SethMMorton/natsort'
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('171e3d8336f4fadb1bc9621cae12a39e')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # work alongside python-natsort
  mv "${pkgdir}"/usr/bin/natsort{,2}
}

# vim:set ts=2 sw=2 et:
