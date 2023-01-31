# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='mdsilo-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.5.2
pkgrel=1
pkgdesc='Local-first, lightweight personal wiki, RSS and podcast client (pre-compiled)'
arch=('x86_64')
url='https://mdsilo.com/'
_url='https://github.com/mdSilo/mdSilo'
_rawurl='https://raw.githubusercontent.com/mdSilo/mdSilo'
license=('MIT')
depends=('webkit2gtk')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "$_url/releases/download/app-v$pkgver/${_pkgname}_${pkgver}_amd64.deb"
  "$_rawurl/main/LICENSE"
)

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
  chown -R root:root "$pkgdir/usr"
  install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  '64085d08fc16b1bf88e2509586818cea2d2a3f87cbe93ba286bc83b6f34ce0c7'
   SKIP
)
sha512sums=(
  '6c12bc9cdacded53ad545a8ef7cf86daeea146aa118af3b78e00cfb26cf407db607ab26f242facc1068e00103eddd81936d0df395b7aa62ec601e7abe4aff105'
   SKIP
)
b2sums=(
  '678fabcadbf12c396f3c155eb8cc18e914f457b987b9638662b03652b70d311577ee6d19b4a6723cb83458cbbfdb8197ec04a0a73946b8080ee6900eaf1132af'
   SKIP
)

# eof
