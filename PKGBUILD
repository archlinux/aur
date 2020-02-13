# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kvantum-theme-qogir-git
_gitname=Qogir-kde
pkgver=r37.c6af9dc
pkgrel=1
pkgdesc="Qogir theme for Kvantum"
arch=('any')
url="https://github.com/vinceliuice/Qogir-kde"
license=('GPL3')
depends=('kvantum-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'qogir-kde-theme-git')
_commit='c6af9dc43edb4f0dd53696853cf62835bd6e10f4'
source=("git+https://github.com/vinceliuice/Qogir-kde.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_gitname"
    install -d "$pkgdir/usr/share"
    cp -r Kvantum "$pkgdir/usr/share"
}
