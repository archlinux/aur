# Maintainer: KOSMOSTAR <kosmostaruzb at gmail dot com> https://telegram.me/KOSMOSTAR_UZB

pkgname=e-imzo-bin
_pkgname=e-imzo
pkgver=6.4.7
pkgrel=1
pkgdesc="Uzbek state web identity proving & key signing (E-IMZO)"
arch=('any')
url="https://e-imzo.soliq.uz"
license=('Unlicense')
depends=('java-runtime>=8')
provides=("${_pkgname}=${pkgver}")
conflicts=("$_pkgname" "${_pkgname}-manager")

source=("${_pkgname}-${pkgver}.tar.gz::https://dls.soliq.uz/v${pkgver}/E-IMZO-v${pkgver}.tar.gz"
        "e-imzo"
        "${_pkgname}.desktop"
        "${_pkgname}.service")

sha256sums=('c077152064cd44c8ade4ba877177061a2edfa039a2c0755751cc65e199611a76'
            '095a64e9f78ede2e34fbf889845fb720d276d0f4dce45f074ab189c162ab7259'
            'ff25fda84d5bd9a50d704f908671577bf9d3c5b8fe74331f6a12951ae53f6ed9'
            'ab5e7e5ffa113b4f7a1e3b0e8b27ec4cd7760010b63dd576be06894e4fb5f5f9')

package() {
    install -d "$pkgdir/usr/share/$_pkgname"

    cp -r "$srcdir/E-IMZO/." "$pkgdir/usr/share/$_pkgname/"

    install -Dm755 "$srcdir/e-imzo" "$pkgdir/usr/bin/e-imzo"
    install -Dm644 "$srcdir/e-imzo.desktop" "$pkgdir/usr/share/applications/e-imzo.desktop"
    install -Dm644 "$srcdir/e-imzo.service" "$pkgdir/usr/lib/systemd/user/e-imzo.service"
    chmod 755 "${pkgdir}/usr/share/${_pkgname}"
}
