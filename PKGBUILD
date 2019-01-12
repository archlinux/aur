# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=pkgbuilder
_pyname=pkgbuilder
pkgver=4.3.0
pkgrel=1
pkgdesc='A Python AUR helper/library.'
arch=('any')
url='https://github.com/Kwpolska/pkgbuilder'
license=('BSD')
depends=('python' 'python-setuptools' 'pyalpm>=0.5.1-1' 'python-requests' 'python-srcinfo' 'asp' 'git')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('9c0c6d2d1253fd88fce234d50d83fa5f')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
