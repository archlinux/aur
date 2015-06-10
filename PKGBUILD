# Maintainer: Simon Perry <pezz [@] sanxion [.] net>

pkgname=kip-git
pkgver=20120909
pkgrel=2
pkgdesc="Command line script to keep usernames and passwords in GnuPG encrypted text files"
arch=('any')
url="https://github.com/grahamking/kip"
license=('GPL3')
depends=('python' 'python-distribute')
makedepends=()
options=(!emptydirs)

_gittrunk=https://github.com/grahamking/kip.git
_gitmod=kip

build() {
  if [ -d $_gitmod/.git ]
  then
    (cd $_gitmod && git pull)                                                                                                                          
  else
    git clone $_gittrunk $_gitmod
  fi
     
  msg "GIT clone done or server timeout."
}

package() {
  cd "$srcdir/$_gitmod"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

