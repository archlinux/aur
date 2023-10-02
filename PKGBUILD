pkgname='python-pythonz'
pkgver=2.0.1
pkgrel=2
pkgdesc="Python installation manager supporting CPython, Stackless, PyPy and Jython"
url="https://github.com/saghul/pythonz"
arch=('any')
license=('MIT')
depends=('python' 'python-resumable-urlretrieve')
makedepends=('python' 'python-setuptools')
optdepends=('libtinfo: for running pypy')
conflicts=('python-pythonz-bd')
source=(
    "https://github.com/saghul/pythonz/archive/pythonz-$pkgver.tar.gz"
    "pythonz.sh"
)
sha256sums=('36980ef3b0ad632fb9596c60eb32a3275b2ef3641b07b376924d06ff79b4d539'
            '43f32208f3fc7a2dce93eef8685618c06053c7ed8baed72caef4c4e10d788b0f')

package() {
  cd "$srcdir/pythonz-pythonz-$pkgver"
  PYTHONZ_ROOT="$pkgdir/usr/local/pythonz" python -c "from pythonz.installer import install_pythonz ; install_pythonz()"
  mkdir -p $pkgdir/etc/profile.d
  install $srcdir/pythonz.sh $pkgdir/etc/profile.d
}
