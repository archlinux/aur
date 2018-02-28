# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=delft-icon-theme-git
pkgver=1.1.r0.g8329b5ca
pkgrel=1
pkgdesc="Continuation of Faenza icon theme with up to date app icons"
url="https://github.com/madmaxms/iconpack-delft"
arch=('any')
license=('GPL3')
depends=('gtk-update-icon-cache' 'librsvg')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!strip')
source=("${pkgname%-*}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

package() {
  cd "${pkgname%-*}"
  install -d "$pkgdir/usr/share/icons"
  cp -a Delf* "$pkgdir/usr/share/icons/"
}
