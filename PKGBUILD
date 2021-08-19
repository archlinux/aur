# Maintainer: Nguyen Hong Hiep (Justanoobcoder)

pkgname=opendoas-bin
_pkgname=doas
pkgver=6.9
pkgrel=1
pkgdesc="A portable fork of the OpenBSD doas command "
url="https://github.com/justanoobcoder/OpenDoas"
license=(custom:ISC)
arch=(x86_64)
depends=(pam)
provides=(doas)
replaces=(doas)

source=(
    "${pkgname}-${pkgver}.tar::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar"
)
md5sums=(5d97f3112a37558dd7bb69ebca43ccb8)

backup=(etc/pam.d/doas)

package() {
    cd "${pkgname}-$pkgver"
    install -Dm4755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm0755 vidoas "$pkgdir/usr/bin/vidoas"
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
    install -Dm0644 doas.1 "$pkgdir/usr/share/man/man1/doas.1"
    install -Dm0644 doas.conf.5 "$pkgdir/usr/share/man/man5/doas.conf.5"
}
