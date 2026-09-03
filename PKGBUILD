# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

pkgname='uutils-grep-bin'
pkgdesc='A Rust implementation of GNU Grep'
pkgver=0.2.0
pkgrel=1
url='https://github.com/uutils/grep'
arch=(x86_64)
license=(MIT)
depends=(glibc libgcc)
options=('!debug')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_x86_64=("uu_grep-x86_64-unknown-linux-gnu-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/uu_grep-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('7ffdf7ef9fee0fc07b6a389f14fad0b5236011cf1d08885ffe69f0831f2923e5')

package() {
  cd uu_grep-x86_64-unknown-linux-gnu
  install -D -m 0755 grep "${pkgdir}/usr/bin/uu-grep"
  install -D -m 0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
