# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=albert-python-evaluate
pkgver=r10.b4b8342
pkgrel=1
pkgdesc="Albert extension for easily evaluating python expressions"
arch=('any')
url="https://github.com/Tyilo/albert-extensions"
license=('GPL')
depends=('albert' 'python')
optdepends=('xclip')
source=("git+https://github.com/Tyilo/albert-extensions")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/albert-extensions"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D "${srcdir}/albert-extensions/python_eval.py" "${pkgdir}/usr/share/albert/external/python_eval.py"
	install -Dm 644 "${srcdir}/albert-extensions/python.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/albert-python-evaluate.svg"
}
