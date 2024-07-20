# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=chk-upstream
pkgver=1.2
pkgrel=1
pkgdesc='A tool to track upstream changes: retrieve a git repository version and compare it against a pacman package version'
arch=('x86_64')
url='https://github.com/mutoroglin/chk-upstream'
license=('GPL-3.0-only')
provides=('chk-upstream')
conflicts=('chk-upstream')
depends=(
    'bash'
    'github-cli'
)
makedepends=()
backup=()
optdepends=()
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/mutoroglin/chk-upstream/archive/$pkgver.tar.gz"
)
sha256sums=('9697b5d12524a0a63dc2bafa05f4748559200c86fe4978e2e3bd4677a2a2e55f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    printf "  \033[0;1;34m->\033[0;1m truncate file extension...\033[0m\n"
    cp ${pkgname}.sh ${pkgname}
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 ${pkgname} -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
