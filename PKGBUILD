pkgname=python-pymc3-git
pkgver=v3.0beta.r653.g935779a
pkgrel=1
pkgdesc="Probabilistic Programming in Python. Uses Theano as a backend, supports NUTS and ADVI."
arch=('any')
url="http://pymc-devs.github.io/pymc3/"
license=('APACHE')
depends=('python-joblib' 'python-scipy' 'python-numpy' 'python-matplotlib' 'python-theano' 'python-pandas')
conflicts=('python-pymc3')
makedepends=('git' 'python-setuptools')
options=(!emptydirs)
source=("git://github.com/pymc-devs/pymc3.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pymc3"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/pymc3"
  python setup.py install --root="$pkgdir/" --optimize=1
}
