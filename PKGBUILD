# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld
pkgver=1.2.0
pkgrel=1
pkgdesc="A daemon to prevent the starvation of operating system threads"
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/utils/stalld/stalld.git/"
license=('GPL2')
depends=('glibc')
source=("https://git.kernel.org/pub/scm/utils/stalld/stalld.git/snapshot/stalld-$pkgver.tar.gz")
sha256sums=('83f460cf859ac289b5d071a4f176a80b8012e5146b6c45138e3156cda8788e76')


build() {
  cd "stalld-$pkgver"

  make
}

package() {
  cd "stalld-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "redhat/stalld.service" -t "$pkgdir/usr/lib/systemd/system"
}
