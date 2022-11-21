# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

_pkgbase='keras'
pkgbase="python38-${_pkgbase}"
pkgname=("${pkgbase}")
pkgdesc='A deep learning API written in Python, running on top of the machine learning platform TensorFlow'
url='https://keras.io/'
license=('Apache')
pkgver=2.10.0
pkgrel=1
arch=('any')
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgbase::1}/${_pkgbase}/${_pkgbase//-/_}-${pkgver}-py2.py3-none-any.whl"
        "${_pkgbase}-${pkgver}-LICENSE::https://raw.githubusercontent.com/keras-team/${_pkgbase}/v${pkgver}/LICENSE")
makedepends=('python38-pip')
depends=('absl-py' 'python' 'python38-h5py' 'python38-keras-preprocessing' 'python38-numpy' 'python38-pandas' 'python38-pillow'
         'python38-pydot' 'python38-scipy' 'python38-six' 'python38-tensorflow' 'python38-yaml' 'tensorboard')
sha256sums=('26a6e2c2522e7468ddea22710a99b3290493768fc08a39e75d1173a0e3452fdf'
            '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')

package () {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
    install -Dm 644 "${_pkgbase}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
