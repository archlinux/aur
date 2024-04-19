# Maintainer: littzhch <2371050115@qq.com>
_name=staticx
pkgname=$_name
pkgver=0.14.1
pkgrel=1
epoch=
pkgdesc="Build static self-extracting app from dynamic executable"
arch=('x86_64')
url="https://github.com/JonathonReinhart/staticx"
license=('GPL' 'custom')
groups=()
depends=('python')
makedepends=(python-build python-installer python-wheel)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('9e5087e7fce7a78e9fc925754a644c4f554060cc63a354ef40f841d4fc92afd3')
validpgpkeys=()


build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
