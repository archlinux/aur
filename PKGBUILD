# Maintainer: Daniel Moch <daniel@danielmoch.com>

# Release tag is a lightweight tag, so we need to verify it as a commit
_commit=d500fad6cc2411e41daaf305b77428bf2aa6c681
pkgname=imlib2-heic
pkgver=0.1.0
pkgrel=2
pkgdesc="HEIC/HEIF decoder for imlib2"
arch=('x86_64')
url="https://github.com/vi/${pkgname}"
license=('BSD')
depends=(imlib2 libheif)
makedepends=(git)
source=("git+${url}.git#commit=${_commit}?signed" "LICENSE")
validpgpkeys=('331079CCE5FF6E6C6F2B3019C097221D6E03DF68') # Vitaly Shukela
sha256sums=('SKIP'
            '003ec66759cd96918994a2b65f19352c3caf75def596a6fa047d5ed78b12b7c8')

build()
{
  cd ${pkgname}
  make
}

package()
{
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd ${pkgname}
  make install DESTDIR=${pkgdir}
}

# vim: ft=PKGBUILD sts=2 sw=2 et
