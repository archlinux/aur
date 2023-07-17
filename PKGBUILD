# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=python-parsing-bin
pkgver=2.0.3
pkgrel=2
pkgdesc="A pure-Python module that implements an LR(1) parser generator, as well as CFSM and GLR parser drivers."
arch=('x86_64')
url="http://www.canonware.com/Parsing/"
license=('MIT')
provides=("python-parsing=${pkgver}")
depends=('python>=3.7' 'python-mypy_extensions')
makedepends=('python-pip')

package() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    pip install --root=$pkgdir parsing==$pkgver
    rm -frv "$pkgdir/$_site_packages/parsing/tests"
}
