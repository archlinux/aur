pkgname=ytermusic-bin
pkgver=0.1.0
_pkgvertag="beta-$pkgver"
pkgrel=3
pkgdesc="A terminal based Youtube Music Player. It's aims to be as fast and simple as possible. Writtten in Rust."
url="https://github.com/ccgauche/ytermusic"
arch=('x86_64')
license=('Apache')
depends=('alsa-lib' 'dbus')
conflicts=(ytermusic)
provides=(ytermusic)
source=(${pkgname%-bin}::"$url/releases/download/$_pkgvertag/ytermusic")
sha256sums=('96d0f323c7b0c0019bd996f9b8ac40ba3212b1bb8baaff91ee030249eb090673')

prepare() {
  chmod +x ${pkgname%-bin} 
}

package() {
  install -D -m755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
