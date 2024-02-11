pkgbase='videomass'
pkgname=('videomass')
_module='videomass'
pkgver='5.0.4'
pkgrel=1
pkgdesc="A cross-platform GUI for FFmpeg and youtube-dl or yt-dlp"
url="http://jeanslack.github.io/Videomass/"
depends=('python' 'python-wxpython' 'python-pypubsub' 'python-requests' 'ffmpeg')
optdepends=(
'atomicparsley: For parsing MP4 metadata'
'yt-dlp: Modernified version of youtube-dl, for extracting videos'
)
makedepends=('python-build' 'python-installer')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('26dbf5b8bfd7c82f2038aed5c83b001c9685bd7821f3030ea759465808e8f2c8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
