# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-theme-bundles-git
pkgver=r4.792870f
pkgrel=1
pkgdesc="Built-in theme bundles for the COSMIC desktop environment"
arch=('x86_64')
url="https://github.com/pop-os/cosmic-theme-bundles"
license=('GPL-3.0-only AND CC-BY-NC-SA-4.0')
depends=(
  'cosmic-icons-git'
  'noto-fonts'
  'ttf-opensans'
)
makedepends=(
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/pop-os/cosmic-theme-bundles.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
