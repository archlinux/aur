# Submitter: Germán Osella Massa <gosella@gmail.com>

pkgname=('python-mpld3' 'python2-mpld3')
pkgver=0.3
pkgrel=3
pkgdesc='D3 Viewer for Matplotlib'
arch=('any')
url='http://mpld3.github.io/'
license=('BSD 3-clause')
makedepends=('python-setuptools' 'python2-setuptools')
pypiname='mpld3'
source=("https://pypi.org/packages/source/${pypiname:0:1}/${pypiname}/${pypiname}-${pkgver}.tar.gz")
md5sums=('088251ed3182b2932268f9986cdc2778')

prepare() {
  cd "$srcdir/"
  cp -a "mpld3-${pkgver}" "mpld3-${pkgver}-py2"
}

package_python-mpld3() {
  depends=('python' 'python-matplotlib' 'python-jinja')

  cd "$srcdir/mpld3-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-mpld3() {
  depends=('python2' 'python2-matplotlib' 'python2-jinja')

  cd "$srcdir/mpld3-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
