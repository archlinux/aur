# Maintainer: eomanis at web dot de

pkgname='borgit'
_pkgverUpstream="0.0.1"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=2
pkgdesc="Write your Borg backup jobs with sourced bash configuration files"
arch=('any')
url='https://eomanis.duckdns.org/permshare/borgit/'
license=('GPL3')
depends=('bash' 'coreutils' 'borg')
source=("https://eomanis.duckdns.org/permshare/borgit/borgit-${_pkgverUpstream}.tar.gz")
sha384sums=('1207ef977a6a308e793d8cf994da45232d88089f30b2e1b1028820ff474f7b23b9a64d261c432e77b0da63261d760261')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"
    
    # Place the main bash scripts into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/borgit"
    chmod u=rwx,go=rx "borgit"
    cp -t . "${srcRootDir}/borgem"
    chmod u=rwx,go=rx "borgem"
}
