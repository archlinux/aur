# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=dofi-git
_pkgname=dofi
pkgver=72.785a59f
pkgrel=1
pkgdesc="a todo manager written in bash, using rofi"
arch=('any')
url='https://github.com/carnager/dofi'
provides=('dofi')
license=('GPL')
depends=('bash' 'gawk' 'sed' 'out2html-git' 'grep' 'rofi')
install='dofi-git.install'
makedepends=('git')
source=('git+http://github.com/carnager/dofi.git')

pkgver() {
	cd ${_pkgname}
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${_pkgname}
    make DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       install
}

md5sums=('SKIP')
