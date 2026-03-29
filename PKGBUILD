# Maintainer: Joaquín I. Aramendía <samsagax@gmail.com>
pkgname=brother-dcp-t430w-bin
pkgver=3.6.1
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP-T430W"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('CUSTOM')
install='brother-dcp-t430w.install'
arch=('x86_64')
source=("https://download.brother.com/welcome/dlf106511/dcpt430wpdrv-${pkgver}-1.amd64.deb")
sha256sums=('2d6f73d2703c455f177479c17e35543cb116696de416cf58a8bec543dea8749e')
options=(!strip !debug)

# server doesn't like the curl header
# DLAGENTS="$( IFS=$'\n'; echo "${DLAGENTS[*]}" | grep '^http::' ) --user-agent 'Mozilla/4.0'"

package() {
    tar -xf data.tar.gz -C "${pkgdir}"
    install -Dm 644 -T "${pkgdir}"/opt/brother/Printers/dcpt430w/LICENSE_ENG.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    ln -s "${pkgdir}"/opt/brother/Printers/dcpt430w/lpd/x86_64/brdcpt430wfilter "${pkgdir}"/opt/brother/Printers/dcpt430w/lpd/brdcpt430wfilter
    ln -s "${pkgdir}"/opt/brother/Printers/dcpt430w/lpd/x86_64/brprintconf_dcpt430w "${pkgdir}"/opt/brother/Printers/dcpt430w/lpd/brprintconf_dcpt430w
    chmod 755 "${pkgdir}"/opt/brother/Printers/dcpt430w/cupswrapper
}
