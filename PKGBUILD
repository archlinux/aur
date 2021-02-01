# Maintainer: eomanis at web dot de

pkgname='pulse-autoconf'
_pkgverUpstream="0.0.9"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="PulseAudio server dynamic configuration daemon"
arch=('any')
url='https://eomanis.duckdns.org/permshare/pulse-autoconf/'
license=('GPL3')
depends=('bash' 'coreutils' 'findutils' 'grep' 'libpulse' 'sed')
source=("https://eomanis.duckdns.org/permshare/pulse-autoconf/pulse-autoconf-${_pkgverUpstream}.tar.gz")
sha384sums=('e470b480c0742ed7e65dee8a01fe149ca39e183c241efbd6bdcc0c78e315f20ac33cdabd6525af393d860533b2595727')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/pulse-autoconf"
    chmod u=rwx,go=rx "pulse-autoconf"
}
