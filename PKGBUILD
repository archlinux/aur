# Maintainer: knedl1k <knedl1k at duck dot com>

pkgname=ytermusic-bin
pkgver=0.1.5
_pkgvertag="beta-$pkgver"
pkgrel=1
pkgdesc="A terminal based Youtube Music Player. It aims to be as fast and simple as possible. Written in Rust."
url="https://github.com/ccgauche/ytermusic"
arch=('x86_64')
license=('Apache-2.0')
depends=('alsa-lib' 'dbus' 'gcc-libs')
conflicts=(ytermusic)
provides=(ytermusic)

source=(${pkgname%-bin}::"$url/releases/download/$_pkgvertag/ytermusic-$_pkgvertag-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('88bdc371c3bc2d930c9a72fbf127b2fd8c51df9918180f050fb7d5bafc0b5d21')

package() {
  install -D -m755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
