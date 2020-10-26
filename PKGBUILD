# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-defaults
_name=${pkgname:7}
pkgver=0.2.5
pkgrel=1
pkgdesc="An extension for colcon-core to provide custom default values for the command line arguments from a configuration file."
arch=(any)
url="https://pypi.org/project/$_name"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('ac40fc4ec85cc0633d6c56aa6ebb43203c373cd919d554b1f07fb8f27fdaa2d2')


package() {
    cd ${srcdir}/${_name}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
