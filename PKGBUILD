# Submitter: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Maintainer: Daniel (dot) Funke <ieee.org>
# Thanks to: mmq
 
pkgname=('python-pyejdb' 'python2-pyejdb')
_realname=pyejdb
pkgver=1.0.16
pkgrel=3
pkgdesc="Python binding for EJDB database engine"
arch=('any')
url="https://github.com/Softmotions/ejdb-python"
license=('LGPL2')
provides=("$pkgname=$pkgver")
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/${_realname}/${_realname}-${pkgver}.tar.gz")
md5sums=('5f5856a21ee5af334ed0cf78f6542089')


package_python-pyejdb() {
    depends=('python' 'libejdb')

    cd "${srcdir}/${_realname}-${pkgver}"

    python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1

    rm "${pkgdir}/usr/doc/README.md"
    chmod +r ${pkgdir}/* -R
}

package_python2-pyejdb() {
    depends=('python2' 'libejdb')

    cd "${srcdir}/${_realname}-${pkgver}"

    python2 setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1

    rm "${pkgdir}/usr/doc/README.md"
    chmod +r ${pkgdir}/* -R
}


# vim:set ts=4 sw=4 et:
