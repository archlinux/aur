# Maintainer: Popolon <popolon @ popolon.org >

pkgname='videomass'
pkgver='5.0.6'
pkgrel=1
pkgdesc="A cross-platform GUI for FFmpeg and youtube-dl or yt-dlp"
url="http://jeanslack.github.io/Videomass/"
depends=('python' 'python-wxpython' 'python-pypubsub' 'python-requests' 'ffmpeg')
optdepends=(
'atomicparsley: For parsing MP4 metadata'
'yt-dlp: Modernified version of youtube-dl, for extracting videos'
)
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('GPL-3.0-only')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('83eac6f37e75c08fc822e7348e4b27bc7432a2daacbfbf523d3aec45ee6daec5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
