# Maintainer: Popolon <popolon @ popolon.org >

pkgname='videomass'
pkgver='6.1.12'
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
sha256sums=('81b25c9d48a50dc4e0395abfeade70270fa5f1bf08b0ca1281e3eb714bb53cca')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
