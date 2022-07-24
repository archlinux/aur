# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

pkgname=git-vendor
pkgver=1.3.0
pkgrel=1
pkgdesc="Git command for managing git vendored dependencies"
arch=('any')
license=('MIT')
url="https://brettlangdon.github.io/git-vendor/"
makedepends=()
depends=('git')
optdepends=()
source=("https://github.com/brettlangdon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('774c0ba9596f3231c846dad096f61d7e2906f6fad38c031bf6c01bb8d6c0a338')

build() {
    cd ${pkgname}-${pkgver} # Nothing to do
}

package() {
    cd ${pkgname}-${pkgver}
    make \
        PREFIX="/usr"       \
        SYSCONFDIR="/etc"   \
        DESTDIR="${pkgdir}" \
        install
    install -D -m644 "./LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
