# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

ghuser=Nudin
ghrepo=LexData
pkgname=python-lexdata
pkgver=0.1.10
pkgrel=1
pkgdesc='Python bot framework for Lexemes on Wikidata'
arch=(any)
url="https://${ghuser,,}.github.io/${ghrepo}/"
license=('MIT')
depends=('python'
         'python-requests')
makedepends=('python-pip')
source=("https://github.com/${ghuser}/${ghrepo}/archive/v${pkgver}.tar.gz")
sha256sums=('259824d10551da8a1a4bddfd6e9a1a354f07ca38ca902eb6a17fff35bbf2b13a')

build() {
    cd "${srcdir}/${ghrepo}-${pkgver}"
    pip wheel --no-deps --wheel-dir "${srcdir}" .
}

package() {
    pip install --root "${pkgdir}" --no-deps --ignore-installed "${ghrepo}-${pkgver}-py3-none-any.whl"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}/" "${ghrepo}-${pkgver}/LICENSE"
}
