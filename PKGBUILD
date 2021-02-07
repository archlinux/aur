# Maintainer: eomanis at web dot de

pkgname='pulse-autoconf'
_pkgverUpstream="1.2.0"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="PulseAudio server dynamic configuration daemon"
arch=('any')
url='https://eomanis.duckdns.org/permshare/pulse-autoconf/'
license=('GPL3')
depends=('bash' 'coreutils' 'findutils' 'grep' 'libpulse' 'sed')
source=("https://eomanis.duckdns.org/permshare/pulse-autoconf/pulse-autoconf-${_pkgverUpstream}.tar.gz")
sha384sums=('8daaa5a81ac454a71524f16ef0c436d81a56e340f1db06c95b1f22a0e492fbce44a00d83f812086b16141dd090d269af')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/pulse-autoconf"
    chmod u=rwx,go=rx "pulse-autoconf"

    # Place the Desktop Entry file into /usr/share/applications
    mkdir -p "${pkgdir}/usr/share/applications"
    cd "${pkgdir}/usr/share/applications"
    cp -t . "${srcRootDir}/pulse-autoconf.desktop"
    chmod u=rw,go=r "pulse-autoconf.desktop"
}
