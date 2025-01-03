# Maintainer: Storm Dragon <storm_dragon@stormux.org>
pkgname=python-accessible-output2
_pkgname=accessible_output2
pkgver=0.17
pkgrel=1
pkgdesc="Cross-platform, text-to-speech and Braille library for Python"
arch=('any')
url="https://pypi.org/project/accessible_output2/"
license=('LGPL3')
depends=('python' 'python-libloader' 'python-platform-utils')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('4386fbf030464fb97736db41aa6d5632a0a3157b258af884fa36072d9745c6b17bcbcfd33421c0b0bd20a683bb2db722586e43484263d7a010356cef54fbf688')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
