
pkgname="python-argostranslate-pip"
pkgver=1.6.1
pkgrel=1
pkgdesc="Open source neural machine translation in Python. Designed to be used either as a Python library or desktop application. Uses OpenNMT for translations and PyQt for GUI."
arch=(any)
license=('MIT')
depends=(python python-pytorch python-tqdm)
makedepends=(python-pip)
provides=("python-argostranslate")

pkgver() {
	pip3 show argostranslate | grep 'Version:' | cut -d ' ' -f 2
}

package() {
	PIP_CONFIG_FILE=/dev/null pip3 install --isolated --root="$pkgdir" --ignore-installed --no-deps argostranslate
}
