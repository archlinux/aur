# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bruno Ancona <brunoanconasala@gmail.com>
# Contributor: Famiu Haque <famiuhaque@gmail.com>

pkgname=goneovim-bin
pkgver=0.5.1
pkgrel=2
pkgdesc='Neovim GUI written in Golang, using a Golang qt backend'
arch=(x86_64)
url='https://github.com/akiyosi/goneovim'
license=(MIT)
depends=(expat
         fontconfig
         freetype2
         gcc-libs
         glibc
         gtk3
         libglvnd
         libspeechd
         libx11
         libxcb
         neovim
         nspr
         nss
         postgresql-libs
         qt5-declarative
         qt5-quickcontrols2
         qt5-sensors
         qt5-speech
         qt5-svg
         qt5-tools
         qt5-wayland
         qt5-webengine
         qt5-websockets
         zlib)
provides=("${pkgname%-bin}=$pkgver")
conflicts=(${pkgname%-bin})
source=("$url/releases/download/v$pkgver/Goneovim-v$pkgver-linux.tar.bz2"
        goneovim.desktop
        goneovim.ico)
sha256sums=('ea60465111f088c296372962b16a4a90ec03292d5f8c484cf487e169bc76b79c'
            'bb7dd036f10fe1e9132d2bbbf346e99234425b012fadf177bb212c472ac5fca0'
            '0a36211b6ada93d811575b5ca9b33511e405f61cca791858ea2fe1eb5d29279e')

package() {
	install -Dm0644 -t "$pkgdir/usr/share/pixmaps/" goneovim.ico
	install -Dm0644 -t "$pkgdir/usr/share/applications/" goneovim.desktop
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
	cp -r "Goneovim-latest-linux" "$pkgdir/opt/goneovim"
	ln -snf "/opt/goneovim/goneovim" "$pkgdir/usr/bin/goneovim"
}
