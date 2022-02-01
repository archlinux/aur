# Maintainer : MorsMortium <morsmortium@gmail.com>

pkgname=0x0uploader
pkgver=20.a4a3f6c
pkgrel=3
pkgdesc='Uploader for the 0x0 file sharing service.'
arch=('any')
url="https://codeberg.org/MorsMortium/${pkgname}"
license=('GPL-3.0')
depends=('python' 'python-appdirs' 'python-pyclip' 'python-desktop-notifier' 'curl')
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 ${pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
  install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm 755 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
