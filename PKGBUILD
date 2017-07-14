# Maintainer: Constantin Lorenz <Cons27773964@aol.com>

pkgname=sandboxed-tor-browser
pkgver=0.0.9
pkgrel=1
torbrowserver=7.5a2	# for easier source access
epoch=
pkgdesc="A sandboxed version of the Tor Browser, currently in alpha!"
arch=('x86_64')
url="https://trac.torproject.org/projects/tor/wiki/doc/TorBrowser/Sandbox/Linux"
license=('AGPL3')
groups=()
depends=(bubblewrap gtk3 gnome-themes-standard)
makedepends=(make gcc libnotify)
checkdepends=()
optdepends=(libnotify)
provides=("${pkgname%}")
conflicts=("${pkgname%}")
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("https://www.torproject.org/dist/torbrowser/${torbrowserver}/sandbox-${pkgver}-linux64.zip"{,.asc})
source+=("${pkgname}.desktop"
        "${pkgname}.png")
noextract=()
md5sums=('49042133dbfad9f06df48c934dc123e6'
         '494afbfa60fb4ce21840244cc3f7208c')
md5sums_x86_64=('7b55a4331e9750c662f96216ef2fbfaa'
                'SKIP')
validpgpkeys=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')

package() {
	cd "$srcdir"
	install -Dm 644 ${pkgname}.desktop      ${pkgdir}/usr/share/applications/${pkgname}.desktop
   	install -Dm 644 ${pkgname}.png          ${pkgdir}/usr/share/pixmaps/${pkgname}.png
   	install -Dm 755 ${srcdir}/sandbox/sandboxed-tor-browser           ${pkgdir}/usr/bin/${pkgname}
}
