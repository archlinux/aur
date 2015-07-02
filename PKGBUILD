# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=("python2-novaclient-liberty")
pkgver="2.26.0"
pkgrel="1"
pkgdesc="Python client library for Nova"
arch=("any")
url="https://github.com/openstack/python-novaclient"
license=("Apache")
makedepends=("python2-pip"
             "python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-novaclient/python-novaclient-${pkgver}.tar.gz")
sha256sums=('725e28e981422e051352a76947dfab05838ee687f3c73a6524d64be8af8a900f')

package() {
    depends=("python2-pbr>=0.11"
             "python2-argparse"
             "python2-iso8601>=0.1.9"
             "python2-oslo-i18n-liberty"
             "python2-oslo-serialization-liberty"
             "python2-oslo-utils-liberty"
             "python2-prettytable>=0.7"
             "python2-requests>=2.5.2"
             "python2-simplejson>=2.2.0"
             "python2-six>=1.9.0"
             "python2-babel>=1.3"
             "python2-keystoneclient-liberty")
    cd "${srcdir}/python-novaclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/nova.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/nova"
}
