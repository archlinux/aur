# Maintainer: eomanis at web dot de

pkgname='pulse-autoconf'
_pkgverUpstream="0.0.8"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="PulseAudio server dynamic configuration daemon"
arch=('any')
url='https://eomanis.duckdns.org/permshare/pulse-autoconf/'
license=('GPL3')
depends=('bash' 'coreutils' 'findutils' 'grep' 'libpulse' 'sed')
source=("https://eomanis.duckdns.org/permshare/pulse-autoconf/pulse-autoconf-${_pkgverUpstream}.tar.gz")
sha384sums=('389f221cbc0a2f98545bbe84aebdf5a5c9d11982eb2e37743b3b6ba8d729014246c2f6f827d0a642a14684dfed118831')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/pulse-autoconf"
    chmod u=rwx,go=rx "pulse-autoconf"
}
