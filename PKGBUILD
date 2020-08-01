# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=tensorboardX
pkgname=python-tensorboardx
pkgver=2.1
pkgrel=1
pkgdesc="Tensorboard for PyTorch"
arch=('any')
url="https://github.com/lanpa/tensorboardX"
license=('MIT')
depends=(
    'python-numpy'
    'python-protobuf'
    'python-six'
    )
makedepends=('python-setuptools' 'git')
optdepends=(
    'python-crc32c: speed up'
    'python-soundfile: 200x speed up the add_audio() function'
    )
checkdepends=(
    'python-pytest'
    'python-matplotlib'
    'python-crc32c'
    )
conflicts=('python-tensorboard-git')
source+=("https://github.com/lanpa/tensorboardX/archive/v${pkgver}.tar.gz")
sha256sums=('2556d5601eab25b8fafa20aa0ea36c9c307be225122e68d6047b558edc302fa3')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="${pkgdir}"
}
