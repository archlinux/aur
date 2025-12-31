# Maintainer: Gvrzizo <akoholic@outlook.com>
# Note: lazy-cli uses PyInstaller so beware of it
#       I'm not the dev so this is just FYI.
pkgname=lazy-cli
pkgver=0.2.0.pre.2
pkgrel=1
pkgdesc="Learning at ZJU Yes CLI"
arch=('x86_64')
url="https://github.com/YangShu233-Snow/Learning_at_ZJU_third_client"
license=('LGPL-3.0-only')
provides=('lazy-cli')
conflicts=('lazy-cli-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/YangShu233-Snow/Learning_at_ZJU_third_client/releases/download/v0.2.0-pre.2/lazy-cli-linux-x86_64.tar.gz")
sha256sums=('09d61e4bec73e0dc86e04e07fef12438c3f8cc07bdaf968be9c64dcceeedcf60')
depends=('glibc' 'gcc-libs' 'zlib' 'xz' 'bzip2' 'readline' 'openssl' 'libffi' 'util-linux-libs')

package() {
  cd "$srcdir/lazy"

  install -Dm755 lazy "$pkgdir/usr/lib/lazy/lazy"
  cp -r _internal "$pkgdir/usr/lib/lazy/_internal"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/lazy/lazy "$pkgdir/usr/bin/lazy"
}
