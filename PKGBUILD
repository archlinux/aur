# Maintaoner: Yamada Hayao <hayao@fascode.net>

pkgname=ulauncher-theme-arc-dark-git
pkgver=r7.3083ea2
pkgrel=1
pkgdesc="A theme for Ulauncher based on Arc Theme"
arch=('any')
url="https://github.com/philberndt/Arc-Dark-for-Ulauncher"
license=('Unlicense')
depends=('ulauncher')
makedepends=('git')
source=("git+https://github.com/philberndt/Arc-Dark-for-Ulauncher.git")
md5sums=('SKIP')

pkgver() {
  cd "Arc-Dark-for-Ulauncher"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/usr/share/ulauncher/themes"
    cp -r "${srcdir}/Arc-Dark-for-Ulauncher/arc-dark"* "${pkgdir}/usr/share/ulauncher/themes"
    chmod 755 -R "${pkgdir}/usr/share/ulauncher/themes"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp "${srcdir}/Arc-Dark-for-Ulauncher/license" "${pkgdir}/usr/share/licenses/${pkgname}"
}
