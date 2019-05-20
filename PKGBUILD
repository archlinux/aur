# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-regli
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.2.1
pkgrel=1
pkgdesc="REgular Grid Linear Interpolator"
arch=('i686' 'x86_64')
url="https://github.com/hypergravity/regli"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-scipy' 'python-emcee')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('bc02c475fa7644aee12d58b10b50d68b')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
