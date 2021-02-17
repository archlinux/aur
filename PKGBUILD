# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_project_revenue
_name=trytond_project_revenue
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add revenue on project"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d97759bab1632520b189f402955877e4781f834c48ea081b797d4a189ac73a29')
sha512sums=('e396c03c655ba3c06d77f70480d91a0c735ccff941537e2d1f050841f50d77761402f8abfad622b4411b665cdc244e3b5fbfc153928f42d84667682ed9300ca9')
b2sums=('50494b10c8c2458c341e871b2a11414d7cf29a43afa7da78b05ed40afd7a2e13f3402154980839a96169fee0f6525d86778ca9e85cbd60f9ba83a92bea812519')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
