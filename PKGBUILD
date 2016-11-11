# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-menu3
pkgver=1.0
pkgrel=1
pkgdesc="A simple Python 3.x command line menu system"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/menu3"
license=('GPL')
depends=('python')
_pkgname=menu3
provides=("python-menu3")
#conflicts=("python-menu3")
install=
changelog=
noextract=()
# TODO: FIX THIS FUCKING UGLY URL. the redirection for https://pypi.io/packages/source/m/menu3/menu3-1.0.tar.gz is broken.
source=("https://files.pythonhosted.org/packages/83/00/9cbf6fbe63286cf919e20292663273884ecd9c87d682b4f741e513f7473a/menu3-1.0.zip"
        "menu3-1.0.zip.sig")
sha512sums=('44f0f75acf0d5cd2cd4511a5cb755a6c621967da8da58982d7a4d6ee4881f6d811cd42d22228e38089c22b8f6c62c6b0f4a9c17c1461a18600d691a953f4d802'
            'SKIP')
build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
        python3 setup.py build || return 1
}
package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1 || return 1
}
