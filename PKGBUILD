# Maintainer: Savchenko Dmitriy <apicalium@gmail.com>
pkgname="arachnotron-bin"
pkgver="1.1.4"
pkgrel=1
pkgdesc="Cross platform, advanced Doom launcher built with QT."
arch=('x86_64')
url="http://nephrite.uk/arachnotron"
license=('custom')
groups=()
depends=(
	'brotli'
	'bzip2'
	'double-conversion'
	'e2fsprogs'
	'freetype2'
	'gcc-libs'
	'glib2'
	'glibc'
	'graphite'
	'harfbuzz'
	'icu'
	'keyutils'
	'krb5'
	'libcap'
	'libgcrypt'
	'libglvnd'
	'libgpg-error'
	'libpng'
	'libx11'
	'libxau'
	'libxcb'
	'libxdmcp'
	'lz4'
	'md4c'
	'pcre2'
	'qt5-base'
	'qt5-declarative'
	'systemd-libs'
	'xz'
	'zlib'
	'zstd'
	'qt5-graphicaleffects'
	'qt5-quickcontrols'
)
makedepends=('bash')
optdepends=()
provides=('arachnotron')
conflicts=('arachnotron-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("http://nephrite.uk/storage/app/media/Doom/arachnotron-linux-lite-$pkgver.tar.gz" "arachnowrap")
noextract=()
sha256sums=('2653fcad69a97a7d3f9b96f6e0d80797f315592ffd15f1ab0d7045050fb935cf'
            '0ac7b8fd5497d73ca83ad2f6d0813d3fc49a15eb481ebe84fae9e8d4371fb19e')

package() {
	cd "$srcdir"
  	mkdir -pm 755 $pkgdir/opt/arachnotron
  	install -m 755 arachnotron $pkgdir/opt/arachnotron
  	cp -r --no-preserve=mode,ownership config $pkgdir/opt/arachnotron
  	install -D -m 755 arachnowrap $pkgdir/usr/bin/arachnotron
}
