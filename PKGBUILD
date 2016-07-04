# Arch Linux package build script
#
# Contributor: abadcafe <fwlei@live.com>
#

pkgname=hgsubversion
_dirname=durin42-hgsubversion-49d324e11856
pkgver=1.8.6
pkgrel=1
pkgdesc="extension for Mercurial that allows using Mercurial as a Subversion client"
url="https://bitbucket.org/durin42/hgsubversion"
arch=(any)
license=('GPL2')
depends=('mercurial' 'subversion')
source=("https://bitbucket.org/durin42/$pkgname/get/$pkgver.tar.bz2")
md5sums=('2569ec05f12595a09229147b365c204b')

build() {
  cd "$srcdir/$_dirname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_dirname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

