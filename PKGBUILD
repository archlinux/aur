# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-usersettings
pkgver=1.1.5
pkgrel=2
pkgdesc="Portable Local Settings Storage for Python"
arch=("any")
url="https://pypi.org/project/usersettings"
license=("BSD")
depends=("python" "python-appdirs")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/u/usersettings/usersettings-1.1.5.tar.gz")
sha256sums=("9f84b282982622d8ebfd2d42b482317ae50fb2b3a7fba22e0b0c36cac61ad673")

package() {
    cd "usersettings-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
    for _file in $(ls -1 docs/*); do
        install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/python-usersettings/$(basename ${_file})"
    done

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-usersettings/LICENSE.txt"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/python-usersettings/README.md"
}
