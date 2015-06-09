# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>
pkgname=i3-ipc
pkgver=0.2.0
pkgrel=1
pkgdesc="inter-process communication with i3, the improved tiling window manager."
arch=(any)
url="http://github.com/badboy/i3-ipc"
license=('custom')
depends=('i3-wm' 'ruby')
source=(
  "http://github.com/badboy/i3-ipc/raw/v${pkgver}/i3-ipc"
  "http://github.com/badboy/i3-ipc/raw/v${pkgver}/man/i3-ipc.1"
  "http://github.com/badboy/i3-ipc/raw/v${pkgver}/LICENSE"
)
install='i3-ipc.install'
md5sums=('7696d0e53ebfb3a261e20b1b39e4c71d'
         '971bfaa7d5aff297eff60cd17c93a08d'
         '2fde1ca125088725e39018124051d000')

build() {
  cd "$srcdir/"

  install -Dm755 i3-ipc \
    ${pkgdir}/usr/bin/i3-ipc || return 1

  install -Dm644 i3-ipc.1 \
    ${pkgdir}/usr/share/man/man1/i3-ipc.1 || return 1

  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}

# vim:set ts=2 sw=2 et:
