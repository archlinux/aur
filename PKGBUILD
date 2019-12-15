# Maintainer: Sabart Otto - Seberm <seberm@seberm.com

pkgname=python2-opensubtitles-git
_gitname=${pkgname%-git*}
pkgver='66.ceac6ebad440'
pkgrel=1
pkgdesc="Simple module to access to the OpenSubtitles.org subtitles database. This class is a wrapper for the common methods used by the OpenSubtitles API."
url="https://github.com/agonzalezro/python-opensubtitles"
arch=('any')
license=('ISC')
depends=('python2' 'python2-setuptools')
optdepends=()
conflicts=()
makedepends=()
provides=()
source=("$_gitname::git+https://github.com/agonzalezro/python-opensubtitles.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd $srcdir/${_gitname}
    python2 setup.py install -f --root="$pkgdir"
}
