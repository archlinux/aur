# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-devtools
_name=${pkgname:7}
pkgver=0.2.2
pkgrel=1
pkgdesc="An extension for colcon-core to provide information about the plugin system."
arch=(any)
url="https://pypi.org/project/colcon-devtools/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('6ed3f29052c44e021b64106d5ae338e2b8936ba58c9f1c0496478327973d3f7b')


package() {
    cd ${srcdir}/${_name}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
