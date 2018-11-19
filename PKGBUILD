# Maintainer: algebro <algebro at tuta dot io>
# Maintainer (python-prompt_toolkit-gns3): Stephan Springer <buzo+arch@Lini.de>
# Contributor (python-prompt_toolkit-gns3): Joseph Brains <jnbrains@gmail.com>

_pkgname=prompt_toolkit
pkgname=python-"$_pkgname"1
pkgver=1.0.15
pkgrel=1
pkgdesc="Library for building powerful interactive command lines in Python. Python 3 version from PyPi."
arch=('any')
depends=('python-pygments' 'python-six' 'python-wcwidth')
makedepends=('python-setuptools')
url="https://github.com/jonathanslenders/python-prompt-toolkit"
license=('BSD')
options=(!emptydirs)
provides=("$pkgname")
conflicts=("$_pkgname")
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8bbc5cd2e66d816917')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
