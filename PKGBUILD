# Maintainer: coldbug <coldBug@e.mail.de>
_pkgbase=impacket
pkgname=python-impacket-git
pkgver=impacket_0_11_0.r28.g337d50d0
pkgrel=1
pkgdesc="Collection of classes for working with network protocols"
arch=('any')
conflicts=('impacket')
url="https://github.com/SecureAuthCorp/impacket"
license=("Apache")
provides=('impacket')
depends=('python' 'python-future' 'python-six' 'python-pyasn1' 'python-pycryptodome' 'python-pycryptodomex' 'python-pyopenssl' 'python-ldap3' 'python-flask' 'python-pcapy' 'python-charset-normalizer' 'python-ldapdomaindump')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/SecureAuthCorp/impacket.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbase}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgbase}"
    python setup.py build
}

package() {
	cd "${srcdir}/${_pkgbase}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
