# Maintainer: Christopher Woodruff <cswoodruff@gmail.com>
pkgname=python2-sphinx-autobuild
pkgver=0.6.0
pkgrel=1
pkgdesc="Watch a Sphinx directory and rebuild the documentation when a change is detected. Also includes a livereload enabled web server."
arch=('any')
url="https://github.com/GaretJax/sphinx-autobuild"
license=('MIT')
groups=()
depends=(
  'python2-sphinx'
  'python2-watchdog>=0.7.1'
  'python2-argh>=0.24.1'
  'python2-pathtools>=0.1.2'
  'python2-yaml>=3.10'
  'python2-tornado>=3.2'
  'python2-port-for=0.3.1'
  'python2-livereload>=2.3.0'
)

makedepends=('python2')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(
  https://pypi.python.org/packages/source/s/sphinx-autobuild/sphinx-autobuild-$pkgver.tar.gz
  https://pypi.python.org/packages/2.7/s/sphinx-autobuild/sphinx_autobuild-$pkgver-py2-none-any.whl
)
md5sums=('7331bb8e14b537b871ab8e6e09ff4713'
         'd5a708f79fc3999642c2637cb8ab1d3d')

package() {
  cd "$srcdir/sphinx-autobuild-$pkgver"

  sed -i "s/sphinx-build/sphinx-build2/" sphinx_autobuild/__init__.py

  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
