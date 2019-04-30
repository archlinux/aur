# Maintainer: Peyrille Benjamin <peyrille.benjamin@gmail.com>
# Contributor : Rogalle Quentin <quentin.rogalle@etudiant.univ-perp.fr>
pkgname=othellox
pkgver=0_1
pkgrel=1
pkgdesc="Reversi game in C allowing AI-vs-AI automation"
arch=('any')
url="https://framagit.org/Arkhist/othellox"
license=('MIT')
depends=('ncurses')
makedepends=('clang')
source=("https://framagit.org/Arkhist/othellox/-/archive/master/othellox-master.zip")
sha256sums=('24d34055f1d8f6468b467ea05a860fcf547735cc7aaf414825afe18031219278')

prepare() {
	cd "${pkgname}-master"
}

build() {
	cd "${pkgname}-master"
	cd othellogame
	make
}

check() {
	cd "${pkgname}-master"
}

package() {
	cd "$pkgname-master"
	cd othellogame
	install -Dm755 othellox "${pkgdir}/usr/bin/othellox"
	install -Dm655 include/board.h "${pkgdir}/usr/include/othellox/board.h"
	install -Dm655 include/ai/ai_api.h "${pkgdir}/usr/include/othellox/ai_api.h"
	install -Dm655 include/gameState.h "${pkgdir}/usr/include/othellox/gameState.h"
	install -Dm655 basic-ai "${pkgdir}/usr/share/othellox/basic-ai"
	install -Dm655 ordinatrice-ai "${pkgdir}/usr/share/othellox/ordinatrice-ai"
}
