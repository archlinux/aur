# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=python2-pyvtk-git
pkgver=20150805
pkgrel=1
pkgdesc="tools for manipulating VTK files in Python, git version"
arch=('any')
url="https://github.com/pearu/pyvtk"
license=('GPL')
depends=('python2')
makedepends=('git')
provides=('pyvtk')
conflicts=('pyvtk')
source=('git+https://github.com/pearu/pyvtk.git')
md5sums=('SKIP')

# Git variable.
_gitname=pyvtk

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
    cd "$srcdir/$_gitname"

    python2 setup.py build
    python2 setup.py install --root=$pkgdir
}
