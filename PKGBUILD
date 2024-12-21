# Maintainer: Popolon <popolon @ popolon.org >

pkgname='videomass'
pkgver='5.0.21'
pkgrel=1
pkgdesc="A cross-platform GUI for FFmpeg and youtube-dl or yt-dlp"
url="http://jeanslack.github.io/Videomass/"
depends=('python' 'python-wxpython' 'python-pypubsub' 'python-requests' 'python-hatchling' 'ffmpeg')
optdepends=(
'atomicparsley: For parsing MP4 metadata'
'yt-dlp: Modernified version of youtube-dl, for extracting videos'
)
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-babel')
license=('GPL-3.0-only')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fa5d3ceb34aca8ee40b44b0b2e9e8214e178880ba8affc4016dcb4802c2788a8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
