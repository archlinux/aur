# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pymap3d
_pkgname=${pkgname:7}
pkgver=2.9.1
pkgrel=1
pkgdesc="Python coordinate conversions, following convention of several popular Matlab routines"
arch=(any)
url="https://pypi.org/project/pymap3d/"
license=('BSD-2-Clause License')
makedepends=('python-setuptools'
             'python-pip')
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('6286acf6b36e93ee92d6cc9c0353c258709edfeacd876dc5e87ec2b90ff7ee66')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
