# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=conflict
pkgver=20150705
pkgrel=5
pkgdesc='filename conflict listing'
arch=('x86_64')
url="https://invisible-island.net/${pkgname}/${pkgname}.html"
license=('MIT')
source=("https://invisible-mirror.net/archives/${pkgname}/${pkgname}-${pkgver}.tgz"{,.asc})
depends=('glibc')
sha256sums=('30e14808768a938df139a1b76f8f7397e1b3bf46a18ceabcc8b1b1a70d5ea8a9'
            'SKIP')
validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB') # Thomas Dickey <dickey@invisible-island.net>

build() {
    cd ${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
    install -Dm0644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
