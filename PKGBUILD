# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=chk-upstream
pkgver=1.1
pkgrel=3
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
sha256sums=('17e71e81d2f9923bec651142645f4681e2c89de1305bd99703a5f2bd12ca9dc9')

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
