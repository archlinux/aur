# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>
# Maintainer: Guillaume Brogi <gui-gui@netcourrier.com>

pkgname=(python-pywinrm python2-pywinrm)
_realname=pywinrm
pkgver=0.2.0
pkgrel=3
pkgdesc="Python library for Windows Remote Management"
arch=(any)
url="https://pypi.python.org/pypi/pywinrm"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/diyan/pywinrm/archive/v${pkgver}.tar.gz")
sha256sums=('e8a9afd6f68a152bf9b6ccc07574d35cb4bebe24af779d701c325f0e96226ccc')

package_python2-pywinrm() {
    depends=('python2' 'python2-requests' 'python2-xmltodict')
    optdepends=('python2-requests-ntlm: for HTTP NTLM authentication'
                'python2-requests-kerberos: for kerberos authentication')
    cd ${srcdir}/${_realname}-${pkgver}
    python2 setup.py install --root=${pkgdir}/ --optimize=1
}

package_python-pywinrm() {
    depends=('python' 'python-requests' 'python-xmltodict')
    optdepends=('python-requests-ntlm: for HTTP NTLM authentication'
                'python-requests-kerberos: for kerberos authentication')
    cd ${srcdir}/${_realname}-${pkgver}
    python setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=4 sw=4 et:
