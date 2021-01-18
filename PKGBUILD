# Maintainer: dllud <dllud riseup net>
# Contributor: Daniel Moch <daniel@danielmoch.com>

# Release tag is a lightweight tag, so we need to verify it as a commit
_commit=8362aa93d4aa1826d1293b805c4dd10b9eb206b8
pkgname=imlib2-heic
pkgver=0.1.1
pkgrel=1
pkgdesc="HEIC/HEIF decoder for imlib2"
arch=('x86_64')
url="https://github.com/vi/${pkgname}"
license=('BSD')
depends=(imlib2 libheif)
makedepends=(git)
source=("git+${url}.git#commit=${_commit}?signed")
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # GitHub key
sha256sums=('SKIP')

build()
{
  cd ${pkgname}
  make
}

package()
{
  cd ${pkgname}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make install DESTDIR=${pkgdir}
}

# vim: ft=PKGBUILD sts=2 sw=2 et
