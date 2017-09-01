#Maintainer: Florian Wittmann <fl0w1@disroot.org>
pkgname='python-tcconfig'
_module='tcconfig'
pkgver='0.14.1'
pkgrel=1
pkgdesc="A Simple tc command wrapper tool. Easy to set up traffic control of network bandwidth/latency/packet loss/packet-corruption to a network interface."
url="https://github.com/thombashi/tcconfig"
depends=('python' 'iproute2' 'python-dataproperty>=0.25.6' 'python-simplesqlite>=0.15.0' 'python-subprocrunner>=0.8.7' 'python-typepy>=0.0.20' 'python-voluptuous' \ 
	 'python-ipaddress' 'python-logbook' 'python-pyparsing>=2.2.0' 'python-six')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/tcconfig/archive/v${pkgver}.tar.gz")
md5sums=('bebe8b2b9d76ffd3a39a837c30e10d6b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-tcconfig/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
