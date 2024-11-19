# Maintainer: 0fflineuser <0fflineuser@cock.li>
pkgname=isz-tool-git
pkgdesc="A command line utility to manipulate ISZ files (.isz), including .isz to .iso conversion."
pkgver=r3.1c8541e
pkgrel=1
arch=('x86_64')
url="https://github.com/oserres/isz-tool.git"
license=('GPL-3.0-or-later')
makedepends=('git')
depends=("python>=3.2")
source=("${pkgname}::git+https://github.com/oserres/isz-tool.git")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
	install -pDm755 isz-tool.py "${pkgdir}/usr/bin/isz-tool.py"
}
