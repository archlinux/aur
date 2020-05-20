# Maintainer: Alexander Goussas <alexander@alexandergoussas.com>
pkgname=qobra-git
pkgver=1.3.0r28.48830c8
pkgrel=1
pkgdesc="A simple music player for the command line."
arch=('x86_64')
url="https://www.github.com/aloussase/qobra"
license=('GPL3')
groups=()
depends=(mpg123)
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "1.3.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
  python setup.py build
}

package() {
	cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_*(){ 
  depends=('python-setuptools')
}
