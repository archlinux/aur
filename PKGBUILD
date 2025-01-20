# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ffpyplayer
_name=${pkgname#python-}
pkgver=4.5.2
pkgrel=1
epoch=
pkgdesc="A cython implementation of an ffmpeg based player."
arch=('any')
url="https://pypi.org/project/${_name}"
license=('LGPL-3.0-only')
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    #     python
    brotli
    cython
    fdkaac
    ffmpeg
    freetype2
    fribidi
    harfbuzz
    lame
    libpng
    libtheora
    libogg
    libvorbis
    libvpx
    sdl2
    sdl2_mixer
    nasm
    openssl
    opus
    x265
    xz
    yasm
    zlib
    #AUR
    libbass
)
makedepends=(
    cmake
    python-build
    python-installer
    python-wheel
    python-setuptools
    pkgconf)
optdepends=()
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('f9affdc12ebba4649f116973b9e4e057d06761bc63758594a91ec85f168752fe')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
