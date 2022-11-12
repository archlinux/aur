_pkgbase=stt_model_manager
_pkgname=stt-model-manager
pkgname=python-${_pkgname}
pkgver=0.0.21
pkgrel=2
pkgdesc="Coqui STT Model Manager - install, manage and try out Coqui STT models from the Model Zoo"
arch=('x86_64')
license=('MPL2')
url="https://github.com/coqui-ai/${_pkgname}"
depends=('python-pip' 'python-stt')
source=("${pkgname}-${pkgver}::git+https://github.com/coqui-ai/${_pkgname}.git")
sha256sums=('SKIP')
provides=($_pkgbase)

prepare() {
    echo "Installing Coqui STT Model Manager ${pkgver}-${pkgrel} ..."
}

package() {
    cd $srcdir/${_pkgbase}-${pkgver}
    pip install --root="$pkgdir" .
}
