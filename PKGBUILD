# Maintainer: Alex Zose <alexander[dot]zosimidis[at]gmail[dot]com>
pkgname=crudini
pkgver=0.9
pkgrel=2
pkgdesc="A utility for manipulating ini files"
url="http://www.pixelbeat.org/programs/crudini/"
arch=("any")
license=('GPL2')
depends=('python2-iniparse')
source=("https://github.com/pixelb/crudini/archive/${pkgver}.tar.gz")
sha512sums=("52cbfa0ec5edf68bc066bec68977d09937816fcf07ec71ab1fbe16eb8b667177e163325f67a3ca973e6ec00eb0d1a6f7c4e622ff8af38473651096325f832383")
prepare() {
    sed -i 's/python/python2/' "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
}
package() {
    mkdir -p ${pkgdir}/usr/bin
    install -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" ${pkgdir}/usr/bin
}
