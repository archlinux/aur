pkgname='python-preserve-those-podcasts'
_module='PreserveThosePod'
_src_folder='preservethosepod-1.0.12'
pkgver='1.0.12'
pkgrel=1
pkgdesc="Preserve those podcasts!"
url="https://github.com/saveweb/preserve-those-podcasts"
depends=('python' 'ffmpeg' 'python-requests' 'python-rich' 'python-feedparser' 'python-pyrfc6266' 'python-internetarchive')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
license=('WTFPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/2e/c1/00af5cd84b8b52525dd527a693a1a2fbf7cb2c31ef1d1327d58ecd9c30e4/preservethosepod-1.0.12.tar.gz")
sha256sums=('2f74dcc428e0cc5e2b8c09af78d99697d19b416ec919d95281607cc98baa2bb5')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
