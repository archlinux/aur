# Maintainer: Carl George < arch at cgtx dot us >

_name="python-openstackclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.5.0"
pkgrel="1"
pkgdesc="OpenStack Command-line Client"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=0.11" "python2-pbr>=0.11")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('72d680039381cf42e00c9e3a2c9a33e02132844dc03a798d69d68d46780c8a00')

package_python-openstackclient() {
    depends=("python-babel>=1.3"
             "python-cinderclient>=1.2.2"
             "python-cliff>=1.10.0"
             "python-cliff-tablib>=1.0"
             "python-glanceclient>=0.18.0"
             "python-keystoneclient>=1.6.0"
             "python-neutronclient>=2.3.11"
             "python-novaclient>=2.22.0"
             "python-os-client-config>=1.2.0"
             "python-oslo-config>=1.11.0"
             "python-oslo-i18n>=1.5.0"
             "python-oslo-utils>=1.4.0"
             "python-pbr>=0.11"
             "python-requests>=2.5.2"
             "python-six>=1.9.0"
             "python-stevedore>=1.5.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-openstackclient() {
    depends=("python2-babel>=1.3"
             "python2-cinderclient>=1.2.2"
             "python2-cliff>=1.10.0"
             "python2-cliff-tablib>=1.0"
             "python2-glanceclient>=0.18.0"
             "python2-keystoneclient>=1.6.0"
             "python2-neutronclient>=2.3.11"
             "python2-novaclient>=2.22.0"
             "python2-os-client-config>=1.2.0"
             "python2-oslo-config>=1.11.0"
             "python2-oslo-i18n>=1.5.0"
             "python2-oslo-utils>=1.4.0"
             "python2-pbr>=0.11"
             "python2-requests>=2.5.2"
             "python2-six>=1.9.0"
             "python2-stevedore>=1.5.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
}
