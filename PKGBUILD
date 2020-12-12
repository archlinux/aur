# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-usersettings
pkgver=1.1.5
pkgrel=1
pkgdesc="Portable Local Settings Storage for Python "
arch=("any")
url="https://pypi.org/project/usersettings"
license=("BSD")
depends=("python" "python-appdirs")
makedepends=("python-setuptools")
source=(
    "https://files.pythonhosted.org/packages/c3/f0/48410545aa632941da8d2874a5db3dba4c43d5dd26790a46e14a6c283ec1/usersettings-1.1.5.tar.gz"
)
sha256sums=(
    "9f84b282982622d8ebfd2d42b482317ae50fb2b3a7fba22e0b0c36cac61ad673"
)

package() {
    cd "usersettings-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
    for _file in $(ls -1 docs/*); do
        install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/python-usersettings/$(basename ${_file})"
    done

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-usersettings/LICENSE.txt"
}
