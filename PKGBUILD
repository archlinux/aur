# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname='vapoursynth-preview'
pkgver='0.12.0'
pkgrel='1'
pkgdesc='Previewer for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview'
license=('Apache-2.0')
depends=('python-matplotlib' 'python-qdarkstyle' 'python-pyqt6' 'python-pyqt6-sip' 'python-pyaml' 'python-requests-toolbelt' 'vapoursynth>=R68' 'vapoursynth-plugin-vsengine' 'vapoursynth-plugin-vsjetpack')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f4e835d18574616a34ba69414cb7a7568e6698a613d3312958063e15cd5ff946')

build() {
    cd vs-preview-${pkgver}

    python -m build --wheel --no-isolation
}

package() {
    cd vs-preview-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
