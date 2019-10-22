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
    'c29a9a1a2de9f7132661aab3e772cd82ef5edcdbcb4cd92366366a4b9eea5211d1e9b9d50ec7fb2b0ad262610620b07e64324f02642e1279162ac557a91f550e')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "${pkgdir}/opt/${_gitname}"
    cp -ra ${srcdir}/${_gitname}/* "${pkgdir}/opt/${_gitname}"
    install -Dm 755 ../vspreview "${pkgdir}/usr/bin/vspreview"
}
