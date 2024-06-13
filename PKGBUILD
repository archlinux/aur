# Maintainer: Richard Mathot <richard.mathot@gmail.com>

pkgname=python-nativemessaging-ng
pkgver=1.3.1
pkgrel=1
pkgdesc="A package with basic native messaging apis for webextensions"
arch=('any')
license=('MPL')
url="https://pypi.org/project/nativemessaging-ng/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('firefox' 'chromium' 'google-chrome')
source=("$pkgname-$pkgver.tar.gz::https://github.com/roelderickx/nativemessaging-ng/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('bee40863b961f5123136f374fe0ef9ccbc8165d71dbd15cace7e8f657a0f36338da296863ce5403f8d790268fdc9d21a58537ef9a6079288dec8e33f453a5a02')
_name=${pkgname#python-}

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
