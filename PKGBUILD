# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=tidal-dl
_pkgname=Tidal-Media-Downloader
pkgver=2021.7.6.2
pkgrel=1
pkgdesc="Tidal Music Download"
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('Apache')
depends=('python-aigpy' 'python-requests' 'python-libffmpeg' 'python-pycryptodome' 'python-prettytable' 'python-lyricsgenius')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('97fb5071481ebf972eb17fe3eeb12488bae5cdfbad39f68882ee6ab6264f58a9')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/TIDALDL-PY"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/TIDALDL-PY"
  python setup.py install --root="$pkgdir/" --optimize=1
  # install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
