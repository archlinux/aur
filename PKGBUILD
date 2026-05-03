pkgbase='python-muzlib'
pkgname=('python-muzlib')
_module='muzlib'
pkgver=0.4.1
pkgrel=1
pkgdesc="Muzlib is a Python script that allows you to create your own music library."
url="https://github.com/ezvezdov/muzlib"
depends=(
    'python>=3.10'
    'python-mutagen'
    'python-questionary'
    'python-rich'
    'python-syncedlyrics'
    'yt-dlp'
    'yt-dlp-ejs'
    'python-ytmusicapi'
    'ffmpeg'
    'deno'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('GPL-3.0-or-later')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('6c81e239276436afdc3243bd87e8c9ba7f00055f4a43edde8e81a434e82707d8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/${_module}-${pkgver}-py3-none-any.whl
}
