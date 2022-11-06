# Maintainer: Savchenko Dmitriy <apicalium@gmail.com>
pkgname="arachnotron-bin"
pkgver="1.1.4"
pkgrel=2
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
	'qt5-quickcontrols2'
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
            'f2bf987cbedbb4b4c8afe72b5f714291628f74ae1cc1d05d3d953dfac2605feb')

package() {
	cd "$srcdir"
	sed -i 's+/home/richard/Doom/IWADs/+USERPATH+g' config/settings.json
  	mkdir -pm 755 $pkgdir/opt/arachnotron
  	install -m 755 arachnotron $pkgdir/opt/arachnotron
  	cp -r --no-preserve=mode,ownership config $pkgdir/opt/arachnotron
  	install -D -m 755 arachnowrap $pkgdir/usr/bin/arachnotron
}
