# Maintainer: Joachim Desroches <joachim.desroches@epfl.ch>

pkgname=av-98
pkgver=1.0.2dev
pkgrel=2
arch=(any)

pkgdesc='Command line Gemini client.'
url='https://tildegit.org/solderpunk/AV-98/'
license=(BSD)

depends=(python)
optdepends=('python-ansicolor: neater text display'
           'python-cryptography: better support of TOFU client certificates')
makedepends=(coreutils python-setuptools git)

source=("git+https://tildegit.org/solderpunk/AV-98/")
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
