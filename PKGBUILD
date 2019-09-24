# Maintainer: eomanis at web dot de

pkgname='disk-test'
_pkgverUpstream="0.2.0"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Block device read-write test utility written in bash"
arch=('any')
url='https://eomanis.duckdns.org/permshare/disk-test/'
license=('GPL3')
depends=('bash' 'coreutils' 'diffutils' 'grep' 'openssl' 'pv' 'sed' 'util-linux')
source=("https://eomanis.duckdns.org/permshare/disk-test/disk-test-${_pkgverUpstream}.tar.gz")
sha384sums=('0e90c7dc26bfc45b3b0c3876e30747f3e92e9303d9922c647dc1da67e8ffa46d2b39bdba2d38ea0d05394f35ffd65474')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"
    
    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/disk-test"
    chmod u=rwx,go=rx "disk-test"
}
