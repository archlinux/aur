# Maintainer: Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
pkgname=hyperspy-git
_gitname=hyperspy
pkgver=v0.8.72.gb053fd4
pkgrel=1
pkgdesc="Hyperspectral data analysis"
arch=('any')
url="http://hyperspy.org"
license=('GPL3')

depends=('python2' 'python2-numpy' 'python2-matplotlib' 'python2-traits' 
         'python2-traitsui' 'python2-h5py' 'python2-scikit-learn' 'python2-nose' 
         'python2-statsmodels' 'ipython2' 'python2-jinja' 'python2-pyzmq'
         'python2-pyqt4' 'python2-tornado' 'python2-sip' 'python2-pygments'
         'python2-jsonschema')

optdepends=('python2-pillow: tiff export'
            'python2-seaborn: prettier plotting')

makedepends=('git' 'python2-setuptools' )

provides=('hyperspy')
conflicts=('hyperspy')

# install=
source=('git://github.com/hyperspy/hyperspy.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
