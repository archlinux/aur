pkgname=python-openai-harmony
pkgver=0.0.8
pkgrel=1
pkgdesc="OpenAI Harmony response format library"
arch=('x86_64')
url="https://github.com/openai/harmony"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'rust' 'cargo' 'maturin' 'git' 'gcc' 'perl' 'nasm')
source=("git+https://github.com/openai/harmony.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!lto')

build() {
	cd $srcdir/harmony
	maturin build --release --interpreter python
}

package() {
	cd $srcdir/harmony
	python -m installer --destdir="$pkgdir" target/wheels/*.whl
}
