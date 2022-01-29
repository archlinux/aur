# Maintainer: Mirko Rovere <04mirko@libero.it>
# Contributor: koraynilay <koray.fra@gmail.com>

pkgname="extrattor-git"
pkgver=r187.2c04058
pkgrel=1
pkgdesc="A simple bash wrapper to manage one or more archives from the terminal"
arch=("any")
url="https://github.com/Mirko-r/extrattor"
depends=('unarj' 'unace' 'p7zip' 'tar' 'pax' 'gzip' 'unzip' 'xz')
license=("GPL-3.0")
conflicts=("extrattor")
provides=('extrattor')
makedepends=('git')
source=("git+https://github.com/Mirko-r/extrattor.git")
sha512sums=("SKIP")

_name='extrattor'

pkgver() {
	cd "$_name"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package(){
    install -Dm0755 "${srcdir}/extrattor/extrattor/extrattor.sh" "${pkgdir}/usr/bin/extrattor"
}
