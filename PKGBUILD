pkgname=ytermusic-bin
pkgver=0.1.0
_pkgvertag="alpha-$pkgver"
pkgrel=2
pkgdesc="A terminal based Youtube Music Player. It's aims to be as fast and simple as possible. Writtten in Rust."
url="https://github.com/ccgauche/ytermusic"
arch=('x86_64')
license=('Apache')
depends=('alsa-lib' 'dbus')
conflicts=(ytermusic)
provides=(ytermusic)
source=(${pkgname%-bin}::"$url/releases/download/$_pkgvertag/ytermusic")
sha256sums=('051b7b2adce52487ea49196eff077d940313f8d36a0317a1ea11204dd7708405')

prepare() {
  chmod +x ${pkgname%-bin} 
}

package() {
  install -D -m755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
