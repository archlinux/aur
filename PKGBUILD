# Maintainer: Joachim Desroches <joachim.desroches@epfl.ch>

pkgname=av-98
pkgver=1.0.2dev
pkgrel=4
pkgdesc="A command-line Gemini client."
arch=(any)
url='https://tildegit.org/solderpunk/AV-98/'
license=('BSD')
depends=(python)
makedepends=(coreutils python-setuptools git)
optdepends=('python-ansiwrap: support ANSI escape codes'
            'python-cryptography: better support of TOFU client certificates')
source=("git+https://tildegit.org/solderpunk/AV-98/")
noextract=("AV-98")
sha256sums=(SKIP)

build() {
	cd AV-98
	python3 setup.py build
}

package() {
	cd AV-98
	python3 setup.py install --root="$pkgdir" --optimize=1

	mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
	install -m0644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
