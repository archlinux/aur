# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname='vapoursynth-preview'
pkgver='0.15.0'
pkgrel='1'
pkgdesc='Previewer for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview'
license=('Apache-2.0')
depends=('python-matplotlib' 'python-pyaml' 'python-pyqt6' 'python-pyqt6-sip' 'python-qdarkstyle' 'python-requests-toolbelt' 'vapoursynth>=R68' 'vapoursynth-plugin-vsengine' 'vapoursynth-plugin-vsjetpack')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('537f2b3d6190ab86f9b21066f79844f2fda19b7771e17a37334a6b59762cb489')

build() {
    cd vs-preview-${pkgver}

    python -m build --wheel --no-isolation
}

package() {
    cd vs-preview-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
