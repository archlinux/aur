# Maintainer: ChinaNuke <chinanuke@nuke666.cn>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=layan-kde-git
pkgver=r73.7ab7cd7
pkgrel=1
pkgdesc="A flat Design theme for KDE Plasma desktop"
arch=(any)
url="https://github.com/vinceliuice/Layan-kde"
license=('GPL3')
source=("${pkgname%-git}::git+https://github.com/vinceliuice/Layan-kde.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    provides=('layan-kde')
    optdepends=('kvantum: Better looking'
                'tela-icon-theme: Matching icon theme')

    cd "$srcdir/${pkgname%-git}"

    install -d "$pkgdir/usr/share"

    sed -i "s#/usr/share#$pkgdir/usr/share#" install.sh
    ./install.sh
}

