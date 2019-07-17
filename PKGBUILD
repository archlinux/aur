# Maintainer: Peyrille Benjamin <peyrille.benjamin@gmail.com>
# Contributor : Rogalle Quentin <quentin.rogalle@etudiant.univ-perp.fr>
pkgname=othellox
pkgver=1_1
pkgrel=1
pkgdesc="Reversi game in C allowing AI-vs-AI automation"
arch=('any')
url="https://framagit.org/Arkhist/othellox"
license=('MIT')
depends=('ncurses')
makedepends=('clang')
source=("https://framagit.org/Arkhist/othellox/-/archive/master/othellox-master.zip")
sha256sums=('700b7ee166f2767d9bcf57355e88e4d70d50a849d1c95a002db38266458cb554')

prepare() {
	cd "${pkgname}-master"
}

build() {
	cd "${pkgname}-master"
	cd othellogame
	make ARCHLINUX=yes
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
	install -Dm655 radiation-ai "${pkgdir}/usr/share/othellox/radiation-ai"
	install -Dm655 scanner-ai "${pkgdir}/usr/share/othellox/scanner-ai"
	install -Dm655 xray-ai "${pkgdir}/usr/share/othellox/xray-ai"
	install -Dm655 oracle-ai "${pkgdir}/usr/share/othellox/oracle-ai"
}
