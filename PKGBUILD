pkgname='python-pythonz'
pkgver=2.0.1
pkgrel=1
pkgdesc="Python installation manager supporting CPython, Stackless, PyPy and Jython"
url="https://github.com/saghul/pythonz"
arch=('any')
license=('MIT')
depends=('python' 'python-resumable-urlretrieve')
makedepends=('python' 'python-setuptools')
conflicts=('python-pythonz-bd')
source=(
    "https://github.com/saghul/pythonz/archive/pythonz-$pkgver.tar.gz"
    "pythonz.sh"
)
optdepends=('libtinfo: for running pypy')

package() {
  cd "$srcdir/pythonz-pythonz-$pkgver"
  PYTHONZ_ROOT="$pkgdir/opt/pythonz" python -c "from pythonz.installer import install_pythonz ; install_pythonz()"
  mkdir -p $pkgdir/etc/profile.d
  install $srcdir/pythonz.sh $pkgdir/etc/profile.d
}

md5sums=('f421f13c6c24685d673c462e9771ada6'
         'b600ba39aed7de0e1ed2ed42ff11908c')
