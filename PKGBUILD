# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: mars <gzhqyz at gmail dot com>
# Contributor: Ryan Owens <RyanOwens at linux dot com>

pkgname=gnome-shell-extension-hibernate-status
_uuid='hibernate-status@dromi'
pkgver=1.11.1
pkgrel=5
pkgdesc="Gnome Shell extension that adds a hibernate/hybrid suspend button in Status menu."
arch=('any')
url="https://github.com/arelange/gnome-shell-extension-hibernate-status"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-extension-hibernate-status')
conflicts=('gnome-shell-extension-hibernate-status-git')
_commit=d11284d8e8ef38aaf178963fb950b8ee347451a7
source=("${url}/archive/${_commit}.tar.gz")
sha256sums=('7f9906301df2d94ad472863934329b58ad0090c50bd501a22f774a7c4a73939b')
b2sums=('014464c582a0e2dafe0628dfef1a4b77cbca76925ae58367d7e264acc5e16f9d005c1a1aae6b41cd19e417e8b6cb45d681dcb6d27089a74f1dc378b03fc25535')

build() {
  cd "${pkgname}-${_commit}"
  make
}

package() {
  cd "${pkgname}-${_commit}"
  make DESTDIR="${pkgdir}" install
}
