# Maintainer: Xyne <xyne at archlinux dot org>
_name=cmapPy
_pkgname=python-${_name,,}
pkgname=$_pkgname-git
pkgver=3.3.0.r128.g69f51c0
pkgrel=2
pkgdesc='Tools for interacting with .gctx and .gct and other Connectivity Map resources.'
url='https://github.com/cmap/${_name}'
arch=('any')
license=('BSD')
depends=('python' 'python-numpy' 'python-pandas' 'python-h5py' 'python-requests')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(${_name}::git+https://github.com/cmap/${_name})
sha512sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package ()
{
  cd "$_name"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: ts=2 sw=2 et:
