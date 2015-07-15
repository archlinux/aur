# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=pkgbuilder
_pyname=pkgbuilder
pkgver=4.0.3
pkgrel=1
pkgdesc='A Python AUR helper/library.'
arch=('any')
url='https://github.com/Kwpolska/pkgbuilder'
license=('BSD')
depends=('python' 'python-setuptools' 'pyalpm>=0.5.1-1' 'python-requests' 'python-srcinfo' 'rsync' 'git')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3c11b0a3d52e7c186f42660e7e7a57a7')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
