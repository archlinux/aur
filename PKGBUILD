# Arch Linux package build script
#
# Contributor: abadcafe <fwlei@live.com>
#

pkgname=hgsubversion
pkgver=1.8.1
pkgrel=1
pkgdesc="extension for Mercurial that allows using Mercurial as a Subversion client"
url="https://bitbucket.org/durin42/hgsubversion"
arch=(any)
license=('GPL2')
depends=('mercurial' 'subversion')
source=("https://bitbucket.org/durin42/$pkgname/get/$pkgver.tar.bz2")
md5sums=('2741b5d1d0b0d36e76372efa96a6143d')

build() {
  cd "$srcdir/durin42-hgsubversion-dde1ade36a49"
  python2 setup.py build
}

package() {
  cd "$srcdir/durin42-hgsubversion-dde1ade36a49"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

