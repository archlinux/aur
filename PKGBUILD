# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: workonfire <kolucki62@gmail.com>

pkgname=babi-grammars
_pkgname=babi_grammars
pkgver=0.0.44
pkgrel=1
pkgdesc="Grammars for babi text editor"
arch=('any')
url="https://github.com/asottile/babi-grammars"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ff71b0d7cf88d75b8f667968af1eff0f986af689b163454b659a2301b62fec3d')

build() {
        cd "${_pkgname}-${pkgver}"
        python setup.py build
}

package() {
        cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

