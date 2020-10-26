# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-python-setup-py
_name=${pkgname:7}
pkgver=0.2.7
pkgrel=1
pkgdesc="An extension for colcon-core to identify packages with a setup.py file by introspecting the arguments to the setup() function call of setuptools."
arch=(any)
url="https://pypi.org/project/colcon-python-setup-py"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('eec293085c4301797706d9e61634fa0cb2136be9b820aa556b2b8baa0bde412d')


package() {
    cd ${srcdir}/${_name}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
