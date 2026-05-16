# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

pkgname=ttf-fixedsys-excelsior-linux
pkgver=3.09.10
pkgrel=1
pkgdesc='Fixedsys font for linux, use only at 12pt'
arch=('any')
url='https://github.com/kika/fixedsys'
license=('custom')
options=('!debug')
source=("${url}/releases/download/v${pkgver}/FSEX302.ttf"
        "${url}/releases/download/v${pkgver}/FSEX302-alt.ttf")
sha256sums=('b3f8e1da97b722a42477ee9a72f953eb2bc7c2195df5e2b6b7d4781dd3f8b2cc'
            'e4abb547b387d4676892f2db7c4a19d5cda0a91680ccc52331b2b49456e307da')

package() {
install -Dvm644 FSEX*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
cat << EOF > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
The creator(s) of this content have released it to the public domain.
For jurisdictions where this is not permitted, it is released under
the terms of the Creative Commons Zero Dedication.
EOF
}
