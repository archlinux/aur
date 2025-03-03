# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-icons-git
pkgver=1.0.0.alpha.5.1.r1.g705d398
pkgrel=1
pkgdesc="System76 Cosmic icon theme"
arch=('any')
url="https://github.com/pop-os/cosmic-icons"
license=('CC-BY-SA-4.0 AND GPL-3.0-only')
depends=('pop-icon-theme-git')
makedepends=('git' 'just')
provides=("${pkgname%-git}" 'cosmic-icon-theme')
conflicts=("${pkgname%-git}" 'cosmic-icon-theme')
options=('!strip')
source=('git+https://github.com/pop-os/cosmic-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
