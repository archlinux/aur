# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-doit
_pyname=doit
pkgver=0.27.0
pkgrel=1
pkgdesc='Automation Tool'
arch=('any')
url='http://pydoit.org/'
license=('MIT')
depends=('python' 'python-pyinotify' 'python-six')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('d3171edb1267a915e0ff0c9756d4b0db'
         '7d6fd7c8e022bae9010af272c31eb45f')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
