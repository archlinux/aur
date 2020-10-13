# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>

pkgname=python-plac
pkgver=1.2.0
pkgrel=1
pkgdesc="The smartest command line arguments parser in the world"
url="https://pypi.org/project/plac/"
depends=(python)
makedepends=(python-setuptools)
license=(BSD)
arch=(any)
source=("https://files.pythonhosted.org/packages/f6/79/6d2ddecf6949da3e1f5791d0fb4bd9db826a06294e2422f5da343ef90ce9/plac-1.2.0.tar.gz")
sha256sums=('ca03587234e5bdd2a3fa96f19a04a01ebb5b0cd66d48ecb5a54d42bc9b287320')


build() {
    cd "plac-${pkgver}"
    python setup.py build
}

package() {
    cd "plac-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-plac/LICENSE"
}
