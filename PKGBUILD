# Maintainer: Mario Mansilla <mariomanfer@gmail.com>
pkgname=gtfobins-explorer-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Terminal explorer for GTFOBins web."
arch=(x86_64 i686)
url="https://github.com/creep33/GTFOBins-Explorer.git"
license=('GPL')
groups=()
depends=()
makedepends=(git python2 mdcat python2-pip)
checkdepends=()
optdepends=()
provides=(gtfobins)
conflicts=()
replaces=()
backup=()
options=()
install=gtfobins.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
        cd "${_pkgname}"
        printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        sudo pip2 install html2text
}

package() {
        cd GTFOBins-Explorer
        sudo cp GTFOBins-Explorer-ng /usr/bin/gtfobins
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/README.md"
}
