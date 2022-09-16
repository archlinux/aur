# Maintaoner: Yamada Hayao <hayao@fascode.net>

pkgname=ulauncher-theme-arc-dark-git
pkgver=r2.d98b4ac
pkgrel=1
pkgdesc="A theme for Ulauncher based on Arc Theme"
arch=('any')
url="https://github.com/tjquillan/Arc-Dark-ULauncher"
license=('Unlicense')
depends=('ulauncher')
makedepends=('git')
source=("git+https://github.com/tjquillan/Arc-Dark-ULauncher.git")
md5sums=('SKIP')

pkgver() {
  cd "Arc-Dark-ULauncher"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/usr/share/ulauncher/themes/Arc-Dark"
    cp -r "${srcdir}/Arc-Dark-ULauncher/"* "${pkgdir}/usr/share/ulauncher/themes/Arc-Dark"
    chmod 755 -R "${pkgdir}/usr/share/ulauncher/themes"
}
