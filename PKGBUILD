# Maintainer: Chris Warrick <a@chriswarrick.com>
pkgname=python2-natsort
_pyname=natsort
pkgver=3.5.2
pkgrel=2
pkgdesc='Sort lists naturally.'
arch=('any')
url='https://github.com/SethMMorton/natsort'
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('27c850113c1cca4bcd78cede9930a937')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # work alongside python-natsort
  mv "${pkgdir}"/usr/bin/natsort{,2}
}

# vim:set ts=2 sw=2 et:
