# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-nikola
_pyname=nikola
_pyname2=Nikola
pkgver=7.4.0
pkgrel=1
pkgdesc='A modular, fast, simple, static website generator.'
arch=('any')
url='http://getnikola.com/'
license=('custom')
depends=('python' 'python-doit' 'python-pygments' 'python-pillow'
         'python-docutils' 'python-mako' 'python-unidecode' 'python-lxml'
         'python-yapsy' 'python-pyrss2gen' 'python-dateutil' 'python-logbook'
         'python-blinker' 'python-natsort')
options=(!emptydirs)
conflicts=('python2-nikola' 'python-nikola-git' 'python2-nikola-git')
source=("http://pypi.python.org/packages/source/${_pyname2:0:1}/${_pyname2}/${_pyname}-${pkgver}.tar.gz")
md5sums=('dccd142fdae5a194ebb572142fc3c434')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
