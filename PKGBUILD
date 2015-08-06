# Maintainer: Ari Mizrahi <codemunchies at debugsecurity dot com>
# Contributor: ArchAssault Project <https://www.archassault.org>

pkgname=hashid
pkgver=1.1
pkgrel=3
pkgdesc="Software to identify the different types of hashes used to encrypt data and especially passwords"
arch=('any')
url=('http://code.google.com/p/hash-identifier')
license=('GPL3')
makedepends=('subversion' 'dos2unix')
depends=('python2')
source=('svn+http://hash-identifier.googlecode.com/svn/trunk/')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/trunk/Hash_ID_v$pkgver"

  # Fix line endings.
  dos2unix Hash_ID.py

  # Fix shebang header.
  sed -i 's/env python$/env python2/' Hash_ID.py
}

package() {
  cd "$srcdir/trunk/Hash_ID_v$pkgver"

  install -Dm755 Hash_ID.py "$pkgdir/usr/bin/hashid"
}
