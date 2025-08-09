pkgname='python-dokuwikidumper'
_module='dokuWikiDumper'
_src_folder='dokuwikidumper-0.2.1'
pkgver='0.2.1'
pkgrel=1
pkgdesc="A tool for archiving DokuWiki"
url="https://github.com/saveweb/dokuwiki-dumper"
depends=('python' 'python-lxml' 'python-requests' 'python-internetarchive' 'python-rich' 'python-beautifulsoup4' 'python-slugify' '7zip' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm' 'python-pdm-backend')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/60/ea/742c548b6f9ea5f9b20fbc195d56aca3a7965c8ff9a21f75d1611f55e721/dokuwikidumper-0.2.1.tar.gz")
sha256sums=('7fbaa0462c66550a0bf7eb263f34b33cf239724ccec1679a7abb720c4b20f7b2')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
