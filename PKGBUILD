# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=("python2-novaclient-kilo")
pkgver="2.23.0"
pkgrel="1"
pkgdesc="Python client library for Nova"
arch=("any")
url="https://github.com/openstack/python-novaclient"
license=("Apache")
makedepends=("python2-pip"
             "python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-novaclient/python-novaclient-${pkgver}.tar.gz")
sha256sums=('0f82e723b1cef48df75d4b47ece7dd6ee980563628d8cfbef10cd35707193e07')

package() {
    depends=("python2-pbr>=0.6"
             "python2-argparse"
             "python2-iso8601>=0.1.9"
             "python2-oslo-i18n-kilo"
             "python2-oslo-serialization-kilo"
             "python2-oslo-utils-kilo"
             "python2-prettytable>=0.7"
             "python2-requests>=2.2.0"
             "python2-simplejson>=2.2.0"
             "python2-six>=1.9.0"
             "python2-babel>=1.3"
             "python2-keystoneclient-kilo")
    cd "${srcdir}/python-novaclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/nova.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/nova"
}
