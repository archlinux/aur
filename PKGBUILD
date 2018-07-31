# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

_pkgname=jpype
pkgbase=python-jpype
pkgname=('python-jpype' 'python2-jpype')
pkgdesc="JPype is an effort to allow python programs full access to java class libraries."
pkgver=0.6.3
pkgrel=1
url="https://github.com/jpype-project/jpype"
license=('APACHE')
arch=('x86_64')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jpype-project/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('49664083db6db309c56068ace713059be1fede721c7368fb3fa0ed5cde0aeb6782b2953be9c0d71f8f8028e909e67e525338da0797a5b4bcfc2325614d5849cc')
#validpgpkeys=('') # TODO

prepare() {
    # Create a copy for the python2 package
    cp -r "${_pkgname}-${pkgver}" "python2-${_pkgname}-${pkgver}"
}

package_python-jpype() {
    depends=('python')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-jpype() {
    depends=('python2')

    cd "${srcdir}/python2-${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
