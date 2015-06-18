# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: MatToufoutu <mattoufootu[at]gmail.com>

pkgname=python2-pybloomfiltermmap-git
_gitname='pybloomfiltermmap'
_gitroot='http://github.com/axiak/pybloomfiltermmap/'
pkgver=r98.e34df25
pkgrel=1
pkgdesc="A Bloom filter (bloomfilter) for Python built on mmap. GIT version"
arch=('any')
url='http://github.com/axiak/pybloomfiltermmap/'
license=('MIT')
depends=('python2')
makedepends=('git')
options=('!emptydirs')

conflicts=('python2-pybloomfiltermmap')
provides=('python2-pybloomfiltermmap')

source=("$_gitname"::"git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/${_gitname}
    python2 setup.py install --root=${pkgdir} --optimize=1
}
