# Maintainer: M0Rf30

pkgname=python2-gnupg-hg
_pkgsrcname=python-gnupg
pkgver=r60.975b7e7a64b7
pkgrel=1
pkgdesc="The gnupg module allows Python programs to make use of the functionality provided by the GNU Privacy Guard."
url="https://bitbucket.org/vinay.sajip/python-gnupg"
license=("BSD")
arch=("any")
replaces=('python2-gnupg')
provides=('python2-gnupg')
depends=('python2' 'gnupg')
makedepends=('mercurial')
source=("${_pkgsrcname}::hg+https://bitbucket.org/vinay.sajip/python-gnupg")

build() {
  cd $srcdir/${_pkgsrcname}
  python2 setup.py build
}

package() {
  cd $srcdir/${_pkgsrcname}
  python2 setup.py install --prefix=${pkgdir}/usr --optimize=1
}

pkgver() {
  cd $srcdir/${_pkgsrcname}
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

md5sums=('SKIP')
