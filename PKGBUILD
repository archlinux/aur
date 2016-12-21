# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>
# Maintainer: Guillaume Brogi <gui-gui@netcourrier.com>

pkgname=(python2-pywinrm python-pywinrm)
_realname=pywinrm
pkgver=0.2.2
pkgrel=3
pkgdesc="Python library for Windows Remote Management"
arch=(any)
url="https://pypi.python.org/pypi/${_realname}"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_realname:0:1}/${_realname}/${_realname}-${pkgver}.tar.gz")
sha256sums=('3030f700fbd6d06f715d4374c10b3586624bccca003b7075dd281c875705ac1b')

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
