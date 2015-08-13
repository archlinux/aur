# Arch Linux package build script
#
# Contributor: abadcafe <fwlei@live.com>
#

pkgname=hgsubversion
pkgver=1.8.2
pkgrel=1
pkgdesc="extension for Mercurial that allows using Mercurial as a Subversion client"
url="https://bitbucket.org/durin42/hgsubversion"
arch=(any)
license=('GPL2')
depends=('mercurial' 'subversion')
source=("https://bitbucket.org/durin42/$pkgname/get/$pkgver.tar.bz2")
md5sums=('f3fdd32f63a03d54c88c9f35b3972570')

build() {
  cd "$srcdir/durin42-hgsubversion-38be7a6b6def"
  python2 setup.py build
}

package() {
  cd "$srcdir/durin42-hgsubversion-38be7a6b6def"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

