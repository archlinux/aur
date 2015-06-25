# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python2-natsort
_pyname=natsort
pkgver=4.0.3
pkgrel=1
pkgdesc='Sort lists naturally.'
arch=('any')
url='https://github.com/SethMMorton/natsort'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ef2c4d6e2c5dc0458fe604a91f721aaa')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # work alongside python-natsort
  mv "${pkgdir}"/usr/bin/natsort{,2}
}

# vim:set ts=2 sw=2 et:
