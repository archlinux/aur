# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="communique"
# Temporarily pin to a specific commit. We'll tag a v0.0.1 release soon.
_commit=10dc75050cf8f09bb9d27e0d53e5c10937de54bc
pkgver="v0.0.0_${_commit}"
pkgrel=1
pkgdesc='A TUI instant messaging client compatible with the Jabber network and XMPP.'
url="https://codeberg.org/mellium/communique-tui/"
license=('bsd-2-clause')
arch=('x86_64')
makedepends=('git')
source=("${pkgname}.zip::https://codeberg.org/mellium/communique-tui/archive/${_commit}.zip")
sha256sums=('67dac66ce6cf4fb118f1b16f05e42d6abaef79e3c12246c354c75c9f8e819362')

build() {
	cd ${pkgname}-tui
	make
}

package() {
    cd ${pkgname}-tui
		make DESTDIR="$pkgdir" install
}
