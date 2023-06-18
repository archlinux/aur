# Maintainer : MorsMortium <morsmortium@disroot.org>

pkgname=linker
pkgver=4.40e005b
pkgrel=1
pkgdesc='Open links according to content.'
arch=('any')
url="https://codeberg.org/MorsMortium/${pkgname}"
license=('GPL3')
conflicts=('linker')
depends=('python' 'python-appdirs')
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
