pkgbase=('python2-efilter')
pkgname=('python2-efilter')
_module='efilter'
pkgver='1453815385'
pkgrel=1
pkgdesc="EFILTER query language"
url="https://github.com/google/dotty/"
depends=('python2')
makedepends=('python2-setuptools')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/31/13/a8f1bfc1fa269f2e0177ad6f0da51cb5c5671fba10c1d7abdb108d23bcab/efilter-1453815385.tar.gz#md5=fee6d4220462be189fe3cd7453effc79")
md5sums=('fee6d4220462be189fe3cd7453effc79')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    chmod -R o+r efilter.egg-info 
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
