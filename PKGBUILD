# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname=xcat-git
pkgdesc="A command line tool to XOR a data stream with a given key"

pkgver=r2.d92ce2e
pkgrel=1

arch=(any)

url="https://github.com/mstrand/xcat"
#license=("LicenseRef-unknown")

depends=(python)
makedepends=(git)

provides=(xcat)

source=("git+https://github.com/mstrand/xcat.git")
md5sums=("SKIP")

pkgver() {
  	# move to the source directory
	cd xcat
  	
	# use the number of revisions since beginning of the history
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	# move to the source directory
	cd xcat

	# copy the script to the package
	install -Dm755 xcat.py "${pkgdir}/usr/bin/xcat"
}