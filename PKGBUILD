# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
pkgname=unix-runescape-client
pkgver=4.1.7
pkgrel=1
pkgdesc="RuneScape client for Linux and Unix"
arch=(any)
url="http://hkprojects.weebly.com/runescape-client-for-linux-and-unix.html"
license=(GPL2)
depends=('java-runtime' 'perl' 'perl-wx' 'wget' 'p7zip')
makedepends=('git')
optdepends=(
  'wine: for "compatibility mode" fix'
  'alsa-oss: for "force alsa" fix'
  'pulseaudio: for "force pulseaudio" fix'
  'perl-config-inifiles: instead of builtin'
  'perl-io-stringy: instead of builtin'
)
conflicts=('runescape-client-bin')
install=$pkgname.install
source=("git://github.com/HikariKnight/rsu-client.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
  local _instdir="$pkgdir"/opt/runescape
  cd "$srcdir/rsu-client/runescape"

  mkdir -p "$_instdir" "$pkgdir"/usr/{bin,share/applications}

  # copy the stuff
  cp -t "$_instdir" *.txt runescape updater rsu-settings AUTHORS
  cp -Rt "$_instdir" share rsu
  cp -Rt "$pkgdir"/usr/bin templates/packaging/usr/games/*
  cp -Rt "$pkgdir"/usr templates/packaging/usr/share
}
