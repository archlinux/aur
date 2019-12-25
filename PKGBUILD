# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-astlib
_paname=${pkgbase#python-}
_pyname=astLib
pkgname=("python-${_paname}" "python-${_paname}-doc")
pkgver=0.11.3
pkgrel=1
pkgdesc="A set of Python modules that provides some tools for research astronomers"
arch=('i686' 'x86_64')
url="http://astlib.sourceforge.net"
license=('LGPL')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('003447812e19966f0e7e3dc9ccaedfaff76fe4a452e311bde5d05f6d4fa3e3af')

package_python-astlib() {
    depends=('python-numpy>=1.14.1' 'python-scipy>=0.18.1' 'python-matplotlib' 'python-astropy')
    optdepends=('python-astlib-doc: Documentation for astLib')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-astlib-doc() {
    pkgdesc="Documentation for astLib"
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgbase}/html" ${_pyname}/*
}
