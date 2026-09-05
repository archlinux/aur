# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-orchat
_pkgname=orchat
pkgver=1.4.6
pkgrel=1
pkgdesc="A powerful CLI for chatting with AI models through OpenRouter"
arch=('any')
url="https://github.com/oop7/OrChat"
license=('MIT')
depends=('python' 'python-requests' 'python-tiktoken' 'python-rich' 'python-dotenv' 'python-colorama' 'python-packaging' 'python-pyfzf' 'python-cryptography' 'python-prompt_toolkit' 'python-beautifulsoup4' 'python-html2text')
makedepends=('python-build' 'python-installer' 'python-wheel')
_tag="v1.4.6"
_srcdir="OrChat-1.4.6"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/oop7/OrChat/tar.gz/refs/tags/$_tag")
sha256sums=('fbe070754e2d66c3f724e496241975f0cd4e209c7c590cca395c38cabd3b65ae')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
