# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=("python2-neutronclient-liberty")
pkgver="2.6.0"
pkgrel="1"
pkgdesc="Python client library for Neutron"
arch=("any")
url="https://github.com/openstack/python-neutronclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-neutronclient/python-neutronclient-${pkgver}.tar.gz")
sha256sums=('ce72506c0720825edcb0e93b643340e044f1de9235d398fe1c45d851971020df')


package() {
    depends=("python2-pbr>=0.11"
             "python2-argparse"
             "python2-cliff-liberty"
             "python2-iso8601>=0.1.9"
             "python2-netaddr>=0.7.12"
             "python2-oslo-i18n-liberty"
             "python2-oslo-serialization-liberty"
             "python2-oslo-utils-liberty"
             "python2-requests>=2.5.2"
             "python2-keystoneclient-liberty"
             "python2-simplejson>=2.2.0"
             "python2-six>=1.9.0"
             "python2-babel>=1.3"
             )
    cd "${srcdir}/python-neutronclient-${pkgver}"
    sed -ri '/argparse|pbr/d' requirements.txt
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/neutron.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/neutron"
}
