# Maintainer: Constantin Lorenz <Cons27773964@aol.com>

pkgname=sandboxed-tor-browser
pkgver=0.0.3
pkgrel=1
torbrowserver=7.0a1	# for easier source access
epoch=
pkgdesc="A sandboxed version of the Tor Browser, currently in alpha!"
arch=('x86_64')
url="https://trac.torproject.org/projects/tor/wiki/doc/TorBrowser/Sandbox/Linux"
license=('AGPL3')
groups=()
depends=(bubblewrap gtk3 gnome-themes-standard)
makedepends=(make gcc gb go libnotify)
checkdepends=()
optdepends=(libnotify)
provides=("${pkgname%}")
conflicts=("${pkgname%}")
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("https://www.torproject.org/dist/torbrowser/${torbrowserver}/sandbox-${pkgver}-linux64.zip")
source+=("${pkgname}.desktop"
        "${pkgname}.png")
noextract=()
md5sums=('49042133dbfad9f06df48c934dc123e6'
         '494afbfa60fb4ce21840244cc3f7208c')
md5sums_x86_64=('6aecb89fbbcec84e5019137ee775074e')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm 644 ${pkgname}.desktop      ${pkgdir}/usr/share/applications/${pkgname}.desktop
   	install -Dm 644 ${pkgname}.png          ${pkgdir}/usr/share/pixmaps/${pkgname}.png
   	install -Dm 755 ${srcdir}/sandbox/sandboxed-tor-browser           ${pkgdir}/usr/bin/${pkgname}
}
