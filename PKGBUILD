# Maintainer: ChinaNuke <chinanuke@nuke666.cn>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=plasma5-themes-layan-git
pkgver=r73.7ab7cd7
pkgrel=1
pkgdesc="A flat Design theme for KDE Plasma desktop"
arch=(any)
url="https://github.com/vinceliuice/Layan-kde"
license=('GPL3')
makedepends=('git')
optdepends=('kvantum: Better looking for application styles'
            'tela-icon-theme: Matching icon theme')
provides=('layan-kde-git')
replaces=('layan-kde-git')
options=('!strip')
source=("${pkgname%-git}::git+https://github.com/vinceliuice/Layan-kde.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i "s#/usr/share#$pkgdir/usr/share#" install.sh
}

package() {
    cd "$srcdir/${pkgname%-git}"

    install -d "$pkgdir/usr/share"
    ./install.sh
}
