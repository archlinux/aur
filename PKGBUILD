# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

pkgname=ttf-fixedsys-excelsior-linux
pkgver=3.09.10
pkgrel=2
pkgdesc='Fixedsys font for linux, use only at 12pt'
arch=('any')
url='https://github.com/kika/fixedsys'
license=('custom')
options=('!debug')
source=("${url}/releases/download/v${pkgver}/FSEX302.ttf"
        "${url}/releases/download/v${pkgver}/FSEX302-alt.ttf")
sha256sums=('842f8fbf80f57d867aeb1d2988140d3ea8b4718e5f687035b0a3b66756df3899'
            '21b801fe4179dc884a9836d1fbd570ce83249d77204a0a017fbae14aa2dea132')

package() {
install -Dvm644 FSEX*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
cat << EOF > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
The creator(s) of this content have released it to the public domain.
For jurisdictions where this is not permitted, it is released under
the terms of the Creative Commons Zero Dedication.
EOF
}
