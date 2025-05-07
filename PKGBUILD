# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname='vapoursynth-preview'
pkgver='0.13.0'
pkgrel='1'
pkgdesc='Previewer for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview'
license=('Apache-2.0')
depends=('python-matplotlib' 'python-qdarkstyle' 'python-pyqt6' 'python-pyqt6-sip' 'python-pyaml' 'python-requests-toolbelt' 'vapoursynth>=R68' 'vapoursynth-plugin-vsengine' 'vapoursynth-plugin-vsjetpack')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f6b1b6a10f866ff736f2b7b309748027282870fb1eab2885f70be5a910d6689f')

build() {
    cd vs-preview-${pkgver}

    python -m build --wheel --no-isolation
}

package() {
    cd vs-preview-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
