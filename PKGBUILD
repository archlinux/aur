# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=python-sphinx-autobuild
pkgver=0.7.1
pkgrel=1
pkgdesc="Watch a Sphinx directory and rebuild the documentation when a change is detected. Also includes a livereload enabled web server."
arch=('any')
url="https://github.com/GaretJax/sphinx-autobuild"
license=('MIT')
groups=()
depends=(
  'python-sphinx'
  'python-watchdog>=0.7.1'
  'python-argh>=0.24.1'
  'python-pathtools>=0.1.2'
  'python-yaml>=3.10'
  'python-tornado>=3.2'
  'python-port-for=0.3.1'
  'python-livereload>=2.3.0'
)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(
  https://files.pythonhosted.org/packages/source/s/sphinx-autobuild/sphinx-autobuild-$pkgver.tar.gz
)
sha256sums=('66388f81884666e3821edbe05dd53a0cfb68093873d17320d0610de8db28c74e')

package() {
  cd "$srcdir/sphinx-autobuild-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
