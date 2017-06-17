# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=kattis-cli-git
pkgver=r42.e18dd19
pkgrel=1
pkgdesc="Kattis online judge command line tool"
arch=('any')
url="https://github.com/Kattis/kattis-cli"
license=('MIT')
depends=('python' 'python-requests')
source=("git+https://github.com/Kattis/kattis-cli")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/kattis-cli"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D "${srcdir}/kattis-cli/submit.py" "${pkgdir}/usr/bin/kattis"
}
