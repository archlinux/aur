# Maintainer: Arijit Dey <arijid79@gmail.com>
pkgname=pbss-git
pkgver=v1.0.r17.8e38c53r40.8e38c53
pkgrel=1
pkgdesc="Practically Better Style Sheets"
arch=("any")
url="https://github.com/arijit79/Pbss/"
license=('MIT')
groups=()
depends=("python>=3.7")
makedepends=('git' 'python-setuptools')
provides=("pbss")
conflicts=("pbss")
source=('pbss-git::git+https://github.com/arijit79/Pbss.git#branch=dev')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    sudo pip install $srcdir/${pkgname}
}
