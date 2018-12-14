# Maintainer: Daniel Moch <daniel@danielmoch.com>

# Release tag is a lightweight tag, so we need to verify it as a commit
_commit=d500fad6cc2411e41daaf305b77428bf2aa6c681
pkgname=imlib2-heic
pkgver=0.1.0
pkgrel=1
pkgdesc="HEIC/HEIF decoder for imlib2"
arch=('x86_64')
url="https://github.com/vi/${pkgname}"
# for license, see https://github.com/vi/imlib2-heic/issues/1
license=('LGPL')
depends=(imlib2 libheif)
makedepends=(git)
source=("git+${url}.git#commit=${_commit}?signed")
validpgpkeys=('331079CCE5FF6E6C6F2B3019C097221D6E03DF68') # Vitaly Shukela
sha256sums=('SKIP')

build()
{
  cd ${pkgname}
  make
}

package()
{
  cd ${pkgname}
  make install DESTDIR=${pkgdir}
}

# vim: ft=PKGBUILD sts=2 sw=2 et
