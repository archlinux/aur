# Maintainer: Neo Mineden <neoisathing[at]gmail[dot]com>
# Contributor: 

_gitname="librediscord"
pkgname="librediscord-git"
pkgver=0.1.0
pkgrel=2
pkgdesc="Free and open source voice client for Discord"
url="https://gitlab.com/zipdox/librediscord"
license=("GPL-3.0-or-later")
arch=('x86_64')

depends=(
  'gtk3'
  'libsoup'
  'json-glib'
  'leveldb'
  'rtaudio'
  'opus'
  'libsodium'
  'libsecret'
)
makedepends=(
  'gcc'
  'make'
  'pkg-config'
)

source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
	ls $srcdir/librediscord
	cd "$srcdir/$_gitname"
}

build() {
	make -C "$srcdir/$_gitname" -j
}

package() {
	install -Dm 755 "$srcdir/$_gitname/librediscord.desktop" "$pkgdir/usr/share/applications/librediscord.desktop"
	install -Dm 644 "$srcdir/$_gitname/assets/icon.svg" "$pkgdir/usr/share/pixmaps/librediscord.svg"
	install -Dm 755 "$srcdir/$_gitname/build/librediscord" "$pkgdir/usr/bin/librediscord"
}
