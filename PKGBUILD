# Maintainer: Kimiblock Moe

pkgname=automatamp
pkgver=0.1.2
_tag=513422a17cf6f88d4d9133f8d3fad1c2cb2c1cf0
pkgrel=1
pkgdesc="NieR: Automata Multiplayer Mod (Server)"
arch=("any")
url="https://github.com/praydog/AutomataMP"
license=("MIT")
depends=('enet')
makedepends=('go' 'git')
provides=('automatamp')
backup=()
source=("git+https://github.com/praydog/AutomataMP.git#tag=${_tag}")
sha256sums=('SKIP')

function build() {
	cd "${srcdir}/AutomataMP/server"
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

function package() {
	install -Dm755 "${srcdir}/AutomataMP/server/server" "${pkgdir}/usr/bin/automatamp-server"
}

