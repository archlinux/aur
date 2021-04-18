# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=dungeon-revealer-bin
pkgver=1.13.1
pkgrel=1
pkgdesc="Web app for tabletop gaming to allow the DM to reveal areas of the game map to players"
arch=('x86_64')
url="https://github.com/dungeon-revealer/dungeon-revealer"
license=('ISC')
depends=('sh')
makedepends=()
optdepends=()
options=('!strip')
install=
source=(
  "https://github.com/dungeon-revealer/dungeon-revealer/releases/download/v${pkgver}/dungeon-revealer-linux-v${pkgver}.zip"
  "dungeon-revealer.sh"
  "LICENSE"
)
md5sums=('e4cae3296087df2721c402eeaeb08ebe'
         '045eb0e5977dfea7ccf12097b712ba0f'
         '6c22ecd94b9533c537b70ec0982c5975')

prepare() {
	:
}

build() {
	:
}

package() {
	install -Dm755 "${srcdir}/dungeon-revealer-linux" "$pkgdir/usr/lib/dungeon-revealer/main"
	install -Dm644 "${srcdir}/node_sqlite3.node" "$pkgdir/usr/lib/dungeon-revealer/"
	install -Dm755 "${srcdir}/dungeon-revealer.sh" "$pkgdir/usr/bin/dungeon-revealer"
	install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
