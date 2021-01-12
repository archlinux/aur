# Maintainer: Bryan Ndjeutcha <ndjeutcha@gmail.com>
pkgname=wofer-git
pkgver=r103.0499883
pkgrel=1
pkgdesc="unopiniated script that emulates a file manager"
arch=('x86_64')
url="https://gitlab.com/snakedye/wofer"
license=('MIT')
makedepends=('git')
optdepends=('fd: search for files in directory hierarchy')
provides=("wofer-git")
conflicts=("wofer-git")
source=("$pkgname::git+https://gitlab.com/snakedye/wofer.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
  install -Dm755 ./wofer "$pkgdir/usr/bin/wofer"
  install -Dm644 ./README.md "$pkgdir/usr/share/doc/wofer"
}

