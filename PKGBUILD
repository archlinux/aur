# Maintainer: Erhan SAHIN <erhan@ssahin.net>

_name="python-neutronclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python2-neutronclient-kilo")
pkgver="2.4.0"
pkgrel="1"
pkgdesc="Python client library for Neutron"
arch=("any")
url="https://github.com/openstack/python-neutronclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-neutronclient/python-neutronclient-${pkgver}.tar.gz")
sha256sums=('f4cfcdb33221f7fb8310600a07a783aecdb2adb16bc51a66b28aea1a35735c61')


package() {
    depends=("python2-pbr>=0.6"
             "python2-argparse"
             "python2-babel>=1.3"
             "python2-cliff-kilo"
             "python2-iso8601>=0.1.9"
             "python2-netaddr>=0.7.12"
             "python2-oslo-i18n-kilo"
             "python2-oslo-serialization-kilo"
             "python2-oslo-utils-kilo"
             "python2-requests>=2.2.0"
             "python2-keystoneclient-kilo"
             "python2-simplejson>=2.2.0"
             "python2-six>=1.9.0"
             "python2-babel>=1.3")
    cd "${srcdir}/python-neutronclient-${pkgver}"
    sed -ri '/argparse|pbr/d' requirements.txt
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/neutron.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/neutron"
}
sha256sums=('4c5c3a79216c682926f75ffd8db5f4338525a643ea02de37df7bf82a1e486b28')
