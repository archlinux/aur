# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=tensorboardX
pkgname=python-tensorboardx
pkgver=2.4
pkgrel=1
pkgdesc="Tensorboard for PyTorch"
arch=('any')
url="https://github.com/lanpa/tensorboardX"
license=('MIT')
depends=(
    'python-numpy'
    'python-protobuf'
    )
makedepends=('python-setuptools' 'git')
optdepends=(
    'python-crc32c: speed up'
    'python-soundfile: 200x speed up the add_audio() function'
    )
checkdepends=(
    'python-future'
    'python-pytest'
    'python-matplotlib'
    'python-crc32c'
    )
conflicts=('python-tensorboard-git')
source+=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e56331ee79b7656c6f0974ab2e918045d5e9393701f83cac8884de4b5b360130')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="${pkgdir}"
}
