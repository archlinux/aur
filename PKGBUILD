# Maintainer: ftsell <aur@finn-thorben.me>
pkgname=python-exhale
_reponame=exhale
pkgver=0.3.5
pkgrel=1
pkgdesc="A sphinx extension which integrates breathe to enable parsing of doxygen documentation"
arch=('any')
url="https://github.com/svenevs/exhale"
license=('BSD 3')
depends=('python-sphinx' 'python-breathe' 'python-beautifulsoup4' 'python-lxml' 'python-six')
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/svenevs/exhale/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('28233e0b24c8f5b6dafe679eb5575aeeeda678613c66c1f2e937fa2f043910e3')

build() {
	cd "${_reponame}-${pkgver}"
    python setup.py build
}

package() {
	cd "${_reponame}-${pkgver}"
    
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
