# Maintainer: Nathan Monfils <nathanmonfils@gmail.com>

pkgname=catppuccin-qt5ct-git
pkgver=r6.cb58530
pkgrel=1
pkgdesc='Soothing pastel theme for qt5ct & qt6ct '
arch=('any')
license=('MIT')
url='https://github.com/catppuccin/qt5ct'
source=("git+${url}.git")
sha256sums=('SKIP')
optdepends=('qt5ct' 'qt6ct')
makedepends=('git')

pkgver() {
    cd "${srcdir}/qt5ct"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/qt5ct"

    pwd
    ls -la

    for _d in qt5ct qt6ct; do
        install -d "$pkgdir/usr/share/$_d/colors"
        cp -r -a --no-preserve=ownership \
            themes/* "$pkgdir/usr/share/$_d/colors"
    done
}

