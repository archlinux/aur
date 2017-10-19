# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-pyqrcode
pkgver=1.2.1
pkgrel=1
pkgdesc="A QR code generator written purely in Python with SVG, EPS, PNG and terminal output (fixed for python3)"
arch=( 'i686' 'x86_64' )
url="https://pythonhosted.org/PyQRCode/"
license=( 'CUSTOM' )
depends=( 'python' 'python2' )
optdepends=( 'python-pypng: PNG generation support' 'python2-pypng: PNG generation support' )
makedepends=( 'python' 'python2' 'python-setuptools' 'python2-setuptools' )
_pkgname=python-pyqrcode
install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316/PyQRCode-1.2.1.tar.gz#md5=371f29f4b03bd2830c6e0319258b1259"
        "PyQRCode-1.2.1.tar.gz#md5=371f29f4b03bd2830c6e0319258b1259.sig")
sha512sums=('784262cb15c10f3581b0caeac6bba046686b35b8c0709ee78684b805b6cba49f4250a004dc5f7d393cc25929cbf815c6c3a94e284a77d20ff7224a8dde3a036a'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
