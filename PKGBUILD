
pkgname=python-argostranslate-git
pkgver=r434.c97f52519d8d55524bee092ed2bd0cde7d542f68
pkgrel=1
pkgdesc=" Open source neural machine translation in Python. Designed to be used either as a Python library or desktop application. Uses OpenNMT for translations and PyQt for GUI."
arch=('any')
url="https://github.com/argosopentech/argos-translate/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("python-argostranslate")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/argos-translate
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

check() {
  cd $srcdir/argos-translate
  python3 setup.py check
}

package() {
  cd $srcdir/argos-translate
  python setup.py install --root="$pkgdir/" --optimize=1
}
