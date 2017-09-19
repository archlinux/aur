# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=damadamas-icon-theme-git
pkgver=0.2.r11.g40e706c
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
source=("git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd DamaDamas-icon-theme
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  rm -r DamaDamas-icon-theme/{.git,LICENSE,*.md,*.py,*.txt}
  install -d "$pkgdir/usr/share/icons"
  cp -a DamaDamas-icon-theme "$pkgdir/usr/share/icons/"
}
