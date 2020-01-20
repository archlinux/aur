# Maintainer: RedTide <redtid3@gmail.com>

pkgname="elflibviewer"
pkgname_="mpyne-elflibviewer-4ef5cdf4878c"
pkgver=0.10
pkgrel=1
pkgdesc="Lists recursive library dependencies for an ELF executable"
url="https://bitbucket.org/mpyne/${pkgname}/"
arch=('x86_64')
license=('GPL2')
source=("https://bitbucket.org/mpyne/${pkgname}/get/${pkgver}.tar.gz")
sha512sums=('43e22806f137f87ba64cfbebd8dabbacae92b2b79776431b6feb546deca872c2d1d03e3554744f006ad68f42fb4fbd4cd270f45e55191c230d6359bafd62c848')
build() {
    cd "${srcdir}/${pkgname_}"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
    make
}
package() {
    cd "${srcdir}/${pkgname_}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/${pkgname_}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname_}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
