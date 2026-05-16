# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vapoursynth-api3-headers
pkgver=1
pkgrel=3
pkgdesc="Headers from VapourSynth R72 for building API3 plugins"
arch=('x86_64')
url="https://github.com/vapoursynth/vapoursynth"
license=('LGPL-2.1')
depends=("vapoursynth>=74")
conflicts=("vapoursynth<=73")
source=("https://github.com/vapoursynth/vapoursynth/archive/refs/tags/R72.tar.gz")
sha256sums=('650f77feebfd08842b521273f59e0c88f7ba9d7cb5f151d89b79b8dfdd4ce633')

package() {
    _include="$(python -c "import vapoursynth, os; print(os.path.dirname(vapoursynth.__file__))")/include"
    cd "${srcdir}/vapoursynth-R72/include"
    install -Dm644 "VapourSynth.h" "${pkgdir}${_include}/VapourSynth.h"
    install -Dm644 "VSHelper.h" "${pkgdir}${_include}/VSHelper.h"
    install -Dm644 "VSScript.h" "${pkgdir}${_include}/VSScript.h"
}
