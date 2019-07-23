# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=python-bpsproxy
_module='bpsproxy'
pkgver=0.1.3.post1
pkgrel=1
pkgdesc="Blender Power Sequencer proxy generator tool"
url="https://gitlab.com/razcore/bpsproxy"
depends=('python' 'python-tqdm' 'ffmpeg')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('016f64e7bf22399b65c7a8b4fe4478cb447b9bf9961da0482745ebd45f2f0f78')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
