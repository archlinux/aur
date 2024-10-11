# Maintainer : MorsMortium <morsmortium@disroot.org>

pkgname=linker
pkgver=r16.55786e6
pkgrel=1
pkgdesc='Open links according to content.'
arch=('any')
url="https://codeberg.org/MorsMortium/${pkgname}"
license=('GPL-3.0-or-later')
conflicts=('linker')
depends=('python' 'python-appdirs' 'hicolor-icon-theme')
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 ${pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
  install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm 755 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
