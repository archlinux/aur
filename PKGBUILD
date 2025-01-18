# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname='vapoursynth-preview'
pkgver='0.10.1'
pkgrel='1'
pkgdesc='Previewer for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview'
license=('Apache-2.0')
depends=('python-matplotlib' 'python-qdarkstyle' 'python-pyqt6' 'python-pyqt6-sip' 'python-pyaml' 'python-requests-toolbelt' 'vapoursynth>=R65' 'vapoursynth-plugin-vsengine' 'vapoursynth-plugin-vstools')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5bfb48468411d8b4c7aaed4e29b7ceb72fa300d64082302b1d7e22cc167185c2')

build() {
    cd vs-preview-${pkgver}

    python -m build --wheel --no-isolation
}

package() {
    cd vs-preview-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
