# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=harmonize
pkgver=1.0.2
pkgrel=1
pkgdesc="Create and synchronize transcoded copies of audio folders."
url="https://github.com/nvllsvm/harmonize"
depends=('flac' 'lame' 'python' 'python-mutagen')
makedepends=('python-build' 'python-installer')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7853c3592bbfaaa570a5180618b3047a219c50081f85115fd8f46f962be671db')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
