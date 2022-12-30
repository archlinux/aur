# Maintainer: zer0-x < Matrix: "@zer0-x:kde.org" >

pkgname="cwitch"
pkgver="0.2.1"
pkgrel=1
pkgdesc="CLI tool to watch Twitch live streams and videos with the help of mpv and youtube-dl."
arch=('any')
url="https://github.com/zer0-x/cwitch"
license=('GPL3')
depends=('mpv' 'python-mpv' 'youtube-dl' 'python-prompt_toolkit')
makedepends=('python-setuptools')
# checkdepends = ('python-pytest')
# changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zer0-x/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8c22c93c2d8fd9f7fb1c0bd73a7bc10f80985feb0b85dd366f2e3e71e9d9031f05a289b83e5ac94b347bfbc22a8e0f85e0e761b47ee84f732bd946ef507fe595')

build() {
    cd "${pkgname}-${pkgver}"

    python3 setup.py build
}

# check() {
#     cd "${pkgname}-${pkgver}"
#
#     pytest
# }

package() {
    cd "${pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    # TODO: Install shell completions when they are avialable in the source.

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
