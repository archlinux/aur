# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=python-dotenv
pkgbase=python-dotenv
pkgname=('python-dotenv')
pkgver=0.10.1
pkgrel=1
pkgdesc="Get and set values in your .env file in local and production servers"
arch=('any')
url="https://github.com/theskumar/python-dotenv/"
license=('BSD3')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/python-dotenv/python-dotenv-${pkgver}.tar.gz")
sha256sums=('c9b1ddd3cdbe75c7d462cb84674d87130f4b948f090f02c7d7144779afb99ae0')


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
