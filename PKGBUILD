# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_name=language_tool_python
pkgname=python-languagetool-git
pkgver=2.7.0
pkgrel=1
pkgdesc="A free grammar checker for Python"
url="https://pypi.org/project/language-tool-python"
depends=('python' 'python-tqdm' 'python-requests')
makedepends=('git' 'python')
optdepends=()
license=('GPL3')
arch=('any')
source=("git+https://github.com/jxmorris12/$_name.git")
sha256sums=('SKIP')
provides=('python-languagetool')

pkgver() {
	cd "$srcdir/${_name}"
	git tag | grep '^[0-9]' | sort -V -r | head -n1
}

build() {
	cd "$srcdir/${_name}"
	python setup.py build
}

package() {
	cd "$srcdir/${_name}"
	python setup.py install --root="$pkgdir" --optimize=1
}
