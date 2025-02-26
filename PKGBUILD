# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=tf-keras
pkgname=python-${_pkgname}
pkgver=2.18.0
pkgrel=1
pkgdesc='TensorFlow-specific implementation of the Keras API, which was the default Keras from 2019 to 2023.'
arch=('any')
url='https://github.com/keras-team/tf-keras'
license=('Apache-2.0')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('absl-py' 'python' 'python-h5py' 'python-optree' 'python-rich'
         'python-ml-dtypes' 'python-packaging' 'python-numpy' 'python-pandas'
         'python-pillow' 'python-pydot' 'python-scipy' 'python-tensorflow' 'python-yaml'
         'tensorboard')
optdepends=('python-pytorch')
source=("https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-py3-none-any.whl"
        "${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/keras-team/${_pkgname}/v${pkgver}/LICENSE")
sha256sums=('c431d04027eef790fcd3261cf7fdf93eb74f3cb32e05078b57b7f5a54bd53262'
            '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')

package() {
    python -m installer --destdir="$pkgdir" *.whl
    install -Dm 644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
