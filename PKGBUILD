# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=python-dotenv
pkgbase=python-dotenv
pkgname=('python-dotenv')
pkgver=0.7.1
pkgrel=1
pkgdesc="Get and set values in your .env file in local and production servers like Heroku does"
arch=('any')
url="https://github.com/theskumar/python-dotenv/"
license=('BSD3')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/python-dotenv/python-dotenv-${pkgver}.tar.gz")
sha256sums=('45e927c34204c90f5faa35ea8709b894f6b1a7712d77eb50940601068040993b')


build() {
    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python-click')
    optdepends=('ipython')

    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1

    # install -m644 "LICENSE.txt" "$pkgdir"/usr/share/licenses/$pkgname
}
