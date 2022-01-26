# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-proc
pkgver=1.0
pkgrel=3
pkgdesc="Simple interface to Linux process information"
arch=("any")
url="https://github.com/xolox/python-proc"
license=("MIT")
depends=("python" "python-coloredlogs" "python-executor" "python-humanfriendly" "python-property-manager" "python-setuptools")
source=("https://pypi.io/packages/source/p/proc/proc-${pkgver}.tar.gz")
sha256sums=("6c79142bbde22db6f8d1aa7eaf65c9d0667b6abc0ac2433803ae5f03e46d7278")

build() {
    cd "proc-${pkgver}"

    python setup.py build
}

package() {
    cd "proc-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-proc/LICENSE.txt"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/python-proc/README.rst"
    install -Dm644 CHANGELOG.rst "${pkgdir}/usr/share/doc/python-proc/CHANGELOG.rst"
}
