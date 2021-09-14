# Maintainer: Alice S. <quarkyalice@disroot.org>
pkgname=install-date-git
pkgver=r11.083b372
pkgrel=1
pkgdesc="Determine the install date of your Linux install"
arch=('any')
url="https://github.com/alicela1n/install-date"
license=('GPL')
makedepends=(git)
source=("${pkgname}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 install-date "${pkgdir}/usr/bin/install-date"
}
