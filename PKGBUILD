# Maintainer: wallace < str(11) + my_id at gmail dot com>

_gitname=vapoursynth-preview
pkgname=${_gitname}-git
pkgdesc='Preview for VapourSynth scripts'
pkgver=r144.2fbc158
pkgrel=1
arch=('any')
url='https://github.com/Endilll/vapoursynth-preview'
license=('Apache-2.0')
depends=(
    'vapoursynth'
    'python-psutil'
    'python-pyqt5'
    'python-pyaml'
    'python-qdarkstyle')
optdepends=('python-cueparser' 'python-pysubs2')
source=('git+https://github.com/Endilll/vapoursynth-preview.git' 'vspreview')
sha512sums=(
    'SKIP'
    '54f7f97a3f5aa23e447a23e4a7f92e3bc38dad8521e922a3dcffd3c73ec29225692a8a60541d287130a09070440a473ea7b3342029f2dd3c45b31d9ec92cda32')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "${pkgdir}/opt/${_gitname}"
    cp -ra ${srcdir}/${_gitname}/* "${pkgdir}/opt/${_gitname}"
    install -Dm 755 ../vspreview "${pkgdir}/usr/bin/vspreview"
}
