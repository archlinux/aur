# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname='vapoursynth-preview'
pkgver='0.8.0'
pkgrel='1'
pkgdesc='Previewer for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview'
license=('Apache-2.0')
depends=('python-matplotlib' 'python-qdarkstyle' 'python-pyqt6' 'python-pyqt6-sip' 'python-pyaml' 'python-requests-toolbelt' 'vapoursynth>=R65' 'vapoursynth-plugin-vsengine-git' 'vapoursynth-plugin-vstools-git')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9f258ca4e1bb533974190755412935b1d594ec25a468b1283652aeeefa246b12')

build() {
    cd vs-preview-${pkgver}

    python -m build --wheel --no-isolation
}

package() {
    cd vs-preview-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
