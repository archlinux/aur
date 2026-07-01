# Maintainer: Cmd-GZ <newsupergodg@gmail.com>
# Ireozar <ireo@ireo.dev>
# Contributor: Marcin Mielniczuk <marmistrz.dev@zoho.eu>
pkgname=graphwar-git
_pkgname=graphwar
pkgver=r37.a1f7175
pkgrel=2
pkgdesc="Hit your enemies using mathematical functions"
arch=(x86_64 i686)
url="https://github.com/catabriga/graphwar"
license=('GPL-3.0')
depends=('java-runtime>=8')
makedepends=('git' 'java-environment>=8')
source=(
	"git+https://github.com/catabriga/graphwar.git"
	"graphwar.sh"
	"soldierMenu.png"
	"graphwar.desktop"
)
sha256sums=('SKIP'
            '5ef4d4a9272ab3cb51be7231f87031d26868f6398e433328e00cb3f3c139da44'
            '71fda7ad0d810ac0788fde3695c48448fc14e2f14077a50c715161801aafd898'
            'a48cda7a167ad87a5b37dbe2f38297e7b0a2e667a5d3b164316682e22ffe25d8')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
    ./compile.sh
}

package() {
  install -Dm644 "${_pkgname}/graphwar.jar" "${pkgdir}/usr/share/games/graphwar/graphwar.jar"
  install -Dm755 "graphwar.sh" "${pkgdir}/usr/bin/graphwar"
  install -Dm644 "soldierMenu.png" "${pkgdir}/usr/share/pixmaps/soldierMenu.png"
  install -Dm644 "graphwar.desktop" "${pkgdir}/usr/share/applications/graphwar.desktop"
}

