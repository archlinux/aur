# -*- shell-script -*-
#
# Contributor: Adrian C. <anrxc..sysphere.org>
# Contributor: Alan D. Moore <me..alandmoore.com>

pkgname=awesome-scratch-git
_gitname=awesome-configs
pkgver=3.4.14.2.g51f463b
pkgrel=3
pkgdesc="Basic drop-down applications and scratchpad manager for Awesome WM"
arch=("any")
url="http://git.sysphere.org/awesome-configs"
license=("WTFPL2")
depends=("awesome")
makedepends=("git")
# Package was originall awesome-scratchpad-git.  Renamed per original author's intentions.
provides=("awesome-scratchpad-git")
conflicts=("awesome-scratchpad-git")
install="${pkgname}.install"
source=(${pkgname}::git+https://git.sysphere.org/${_gitname})
sha1sums=("SKIP")


pkgver() {
  cd "${pkgname}"
# git describe --always | sed 's|-|.|g'
  git describe --always | sed 's|^[^0-9]*||;s|\.g[a-f0-9]*$||;s|-|.|g'
}


build() {
  cd "${pkgname}"

# Download or update the library
# - automatic since pacman v4.1
}


package() {
  cd "${srcdir}/${pkgname}/scratch"

# Install the scratch library
  install -d "${pkgdir}/usr/share/awesome/lib/scratch"
  install -m644 *.lua "${pkgdir}/usr/share/awesome/lib/scratch"
}
