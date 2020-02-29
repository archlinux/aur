# Maintainer: coldbug <coldBug@e.mail.de>
_pkgbase=impacket
pkgname=python-impacket-git
pkgver=impacket_0_9_20.r90.g13cfc72a
pkgrel=2
pkgdesc="Collection of classes for working with network protocols"
arch=('any')
conflicts=('impacket')
url="https://github.com/SecureAuthCorp/impacket"
license=("Apache")
provides=('impacket')
depends=('python' 'python-future' 'python-six' 'python-pyasn1' 'python-pycryptodome' 'python-pycryptodomex' 'python-pyopenssl' 'python-ldap3' 'python-flask' 'python-pcapy')
makedepends=('git')
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
