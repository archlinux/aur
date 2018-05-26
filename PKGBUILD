# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-steamodd' 'python2-steamodd')
pkgver=4.22
pkgrel=1
pkgdesc="Python module for working with Steam's API"
arch=( 'i686' 'x86_64' )
url="https://steamodd.readthedocs.io/en/latest/"
license=( 'CUSTOM' )
makedepends=( 'python' 'python-setuptools' 'python2' 'python2-setuptools' )
conflicts=('python-steamodd-git')
_pkgname=steamodd
install=
changelog=
noextract=()
source=("https://github.com/Lagg/${_pkgname}/archive/v${pkgver}.tar.gz"
        "v${pkgver}.tar.gz.sig")
sha512sums=('d148becbbd57ffa6ad7741666fc75b0e8ef1719d2c0e89f621d354b803ec0f127b897b7929aa69c97da3bb146d92ced46ba4119d6f8350c5bb9578fbffcd83c0'
            'SKIP')

package_python-steamodd() {
        depends=('python')
        cd "${srcdir}/${_pkgname}-${pkgver}"
        python3 setup.py install --root="${pkgdir}" --optimize=1
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-steamodd() {
        depends=('python')
        cd "${srcdir}/${_pkgname}-${pkgver}"
        python2 setup.py install --root="${pkgdir}" --optimize=1
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
