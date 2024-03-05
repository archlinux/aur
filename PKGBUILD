# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=makepkg-tidy-upx-git
pkgver=r386.7878316
pkgrel=1
pkgdesc='Compress executables during packaging via a makepkg tidy script for UPX.'
arch=('any')
url="https://gitlab.archlinux.org/freso/${pkgname%-git}"
license=('GPL-2.0-or-later')
makedepends=('git' 'coreutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'makepkg-tidy-scripts')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  depends=('upx' 'pacman')
  install -Dm755 "${pkgname%-git}"/upx.sh "$pkgdir"/usr/share/makepkg/tidy/upx.sh
}
