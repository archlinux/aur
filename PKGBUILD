# Maintainer: John Lane <archlinux at jelmail dot com>
#
# Speedtouch Admin Tools for Linux

pkgname=speedtouch-tools
pkgver=r10.ba00e03
pkgrel=1
pkgdesc="Speedtouch 585 Router Admin Tools for the Linux command-line"
arch=(any)
url='https://github.com/johnlane/speedtouch-tools'
license=('MIT')
depends=(python bash)

source=('git+https://github.com/johnlane/speedtouch-tools.git')

md5sums=('SKIP')

package() {
  install -dm755 $pkgdir/usr/{bin,lib/stt}
  install ${srcdir}/${pkgname}/bin/* $pkgdir/usr/bin
  install ${srcdir}/${pkgname}/lib/stt/* $pkgdir/usr/lib/stt
}

pkgver() {
  cd "$srcdir/speedtouch-tools"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
