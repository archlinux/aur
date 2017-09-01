# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=damadamas-icon-theme-git
pkgver=0.2.r0.gf960e00
pkgrel=1
pkgdesc="DamaDamas icons aim to offer a familiar interface to the users"
url="https://github.com/sonakinci41/DamaDamas-icon-theme"
arch=('any')
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!strip')
source=("${pkgname%-*}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-*}"
  rm {CMakeLists.txt,LICENSE,README.md}
  install -d "$pkgdir/usr/share/icons/damadamas"
  cp -a * "$pkgdir/usr/share/icons/damadamas/"
}
