# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sathya Pramodh <sathyapramodh17@gmail.com>
pkgname=resetti
_rawurl="https://raw.githubusercontent.com/tesselslate/resetti/main"
pkgver="0.5.3"
pkgrel=1
pkgdesc="resetti is a Linux-compatible reset macro for Minecraft speedruns. It supports
a variety of different resetting styles, categories, and Minecraft versions."
arch=('x86_64' 'i686')
url="https://www.github.com/tesselslate/resetti"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("$url/releases/download/v$pkgver/resetti"
	"$url/releases/download/v$pkgver/bench"
	"$_rawurl/internal/res/default.toml"
	"$_rawurl/internal/res/scene-setup.lua")
noextract=()
md5sums=('SKIP' 'SKIP')
validategpgkeys=()

package() {
	install -Dm0755 resetti "${pkgdir}/usr/bin/${pkgname}"
	if ! [ -d ~/.local/share/resetti ]
	then
		mkdir -p ~/.local/share/resetti
	fi
	install -Dm0755 bench ~/.local/share/resetti
	install -Dm0664 default.toml ~/.local/share/resetti
	install -Dm0644 scene-setup.lua ~/.local/share/resetti
}
