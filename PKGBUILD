# This is based on https://aur.archlinux.org/packages/pyrepl/, and modified
# to use the Mercurial repository, since there has not been a release for a
# long time.
pkgname=python-pyrepl-git
_realpkg=pyrepl
pkgver=0.9.0.32.g0f07d6d
pkgrel=1
pkgdesc="A Python library for building flexible command line interfaces"
url="https://github.com/blueyed/pyrepl"
arch=("any")
license=('MIT')
depends=('python')
conflicts=('python-pyrepl' 'python-pyrepl-hg')
provides=('python-pyrepl' 'python-pyrepl-hg')
source=("git+https://github.com/pypy/pyrepl")
md5sums=('SKIP')
makedepends=('git' 'python')

pkgver() {
  cd "$_realpkg"
  git describe --tags | sed 's/^v//;s/-/./g'
}

package() {
  cd "$srcdir/$_realpkg"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
