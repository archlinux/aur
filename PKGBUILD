# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-doit
_pyname=doit
pkgver=0.26.0
pkgrel=1
pkgdesc='Automation Tool'
arch=('any')
url='http://pydoit.org/'
license=('MIT')
depends=('python' 'python-pyinotify' 'python-six')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/$(echo ${_pyname} | cut -c1)/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('24d83f64024649e701f4dd2f0e391980'
         '7d6fd7c8e022bae9010af272c31eb45f')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
