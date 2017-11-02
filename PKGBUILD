# Arch Linux package build script
#
# Contributor: abadcafe <fwlei@live.com>
#

pkgname=hgsubversion
_dirname=durin42-hgsubversion-08ea19b989c3
pkgver=1.9
pkgrel=1
pkgdesc="extension for Mercurial that allows using Mercurial as a Subversion client"
url="https://bitbucket.org/durin42/hgsubversion"
arch=(any)
license=('GPL2')
depends=('mercurial' 'subversion')
source=("https://bitbucket.org/durin42/$pkgname/get/$pkgver.tar.bz2")
md5sums=('ea3d514daf1f524778d4369136ca1ebd')

build() {
  cd "$srcdir/$_dirname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_dirname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

