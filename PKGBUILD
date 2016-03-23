# Maintainer: Roolspub <roolspub@laposte.net>
pkgname=imdbpy-git
pkgrel=1
pkgver=5.0.22.gc4137d9
pkgdesc="Python bindings for the Internet Movie Database (IMDb)"
arch=('any')
url="http://imdbpy.sourceforge.net/"
license=('GPL')
depends=('python2')
provides=('imdbpy')
replaces=('imdbpy')
options=(!emptydirs)
source=('imdbpy::git+https://github.com/alberanid/imdbpy.git')
md5sums=('SKIP')

pkgver() {
    cd "imdbpy"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/imdbpy"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

