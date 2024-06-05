# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-moteus
_name=${pkgname#python-}
pkgver=0.3.70
pkgrel=1
pkgdesc="moteus brushless controller library and tools"
url="https://pypi.org/project/moteus/"
arch=('any')
license=('Apache-2.0')
depends=('python-importlib-metadata' 'python-pyelftools' 'python-pyserial' 'python-can')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
        "https://raw.githubusercontent.com/mjbots/fdcanusb/master/70-fdcanusb.rules")

sha256sums=('491eb3455cc705e18b0b79aa62bc4d0405e2349c363efda6fca58a399badcd4e'
            '6008f3b20baca0e4a077bc45c8e541717d6e3fc63ba7621dc3b1bcb14d86cb23')

package() {
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
    install -Dm 644 70-fdcanusb.rules "$pkgdir/etc/udev/rules.d/70-fdcanusb.rules"
}
