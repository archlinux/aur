# Maintainer: nullableVoidPtr <nullableVoidPtr _ gmail _ com>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Stefano Esposito <ragnarok@email.it>

pkgname=python-pdfminer.six
_name=${pkgname#python-}
pkgver=20201018
pkgrel=1
pkgdesc="Community maintained fork of pdfminer"
url='https://pdfminersix.readthedocs.io/'
arch=('any')
license=('MIT')
depends=('python>=3.6' 'python-chardet' 'python-cryptography')
makedepends=('python-setuptools')
provides=('python-pdfminer'=$pkgver)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha384sums=('608fd8a810ef2e85add322ba68f167101a700f4a597c1c7deb3e3ad95bad50fd151798872f5290294c808cb128c89304')

package() {
    cd "${_name}-${pkgver}"
	export PYTHONHASHSEED=0
    python setup.py install --root="${pkgdir}" -O1
}
