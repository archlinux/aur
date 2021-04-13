# Maintainer: Matei Cotocel <mcotocel at outlook dot com>
pkgname=pactest-git
pkgver=r1.03ad09f
pkgdesc="Test AUR software in a chroot"
pkgrel=1
arch=("any")
url="https://github.com/mcotocel/pactest"
license=('MIT')
depends=('arch-install-scripts' 'wget')
makedepends=('git')
source=("git+https://github.com/mcotocel/pactest")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${srcdir}/pactest/LICENSE"
    install -D -t "${pkgdir}/usr/bin" "${srcdir}/pactest/pactest"
}
