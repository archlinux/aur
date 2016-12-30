# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=nspawn-tools
pkgver=1.0.0
pkgrel=1
pkgdesc="Convenience code for dealing with systemd-nspawn machines"
arch=("any")
url="https://github.com/djmattyg007/nspawn-tools"
license=("GPL3")
depends=("python" "python-executor" "python-humanfriendly" "python-parse" "python-proc")
makedepends=("python-setuptools")
source=("https://github.com/djmattyg007/nspawn-tools/archive/${pkgver}.tar.gz")
sha512sums=("6479dee3c471d1743e3caa982d999b06b955fac3bad3f37df3bd3db9ddb25bcf3a62ce5447b8562ab9ac646130cca358eb722509f67f132d4bc4b69d8ae023d0")

package() {
    cd "nspawn-tools-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/nspawn-tools/LICENSE.txt"
}
