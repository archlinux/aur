# Arch Linux package build script
#
# Contributor: abadcafe <fwlei@live.com>
#

pkgname=hgsubversion
_dirname=durin42-hgsubversion-bb09e8a230d6
pkgver=1.9.2
pkgrel=1
pkgdesc="extension for Mercurial that allows using Mercurial as a Subversion client"
url="https://bitbucket.org/durin42/hgsubversion"
arch=(any)
license=('GPL2')
depends=('mercurial' 'subversion')
source=("https://bitbucket.org/durin42/$pkgname/get/$pkgver.tar.bz2")
md5sums=('2541d0e5a7babae77001e525d76e4b8d')

build() {
  cd "$srcdir/$_dirname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_dirname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

