# Maintainer: Incomplete <incomplete@aixon.co>

pkgname=with-b3-git
pkgdesc="Appends BLAKE3 checksum to a file path"
# pkgver will be updated with pkgver()
pkgver=NA
pkgrel=1
license=('MIT')
url="https://github.com/qwfy/with-b3"
arch=('x86_64')

# An array of packages this package depends on to run
depends=('b3sum')

source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
  git rev-parse master
}

package() {
	cd "${pkgname}"

  install -D -m755 with-b3 "${pkgdir}/usr/bin/with-b3"
}
