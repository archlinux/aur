# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=gnome-shell-extension-nepali-date
_pkgname=nepali-date@biplab
pkgver=r44.759ff70
pkgrel=1
pkgdesc="A gnome-shell extension for Linux that displays Nepali date on the top panel."
arch=('any')
url="https://github.com/Biplab-Dutta/Nepali_Date"
license=('GPL-3.0-only')
depends=('gnome-shell')
makedepends=('git')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_pkgname}"
  cd "${_pkgname}"
  cp extension.js metadata.json stylesheet.css "${pkgdir}/usr/share/gnome-shell/extensions/${_pkgname}"
}
