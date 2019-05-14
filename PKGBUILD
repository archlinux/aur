# Maintainer: eomanis at web dot de

pkgname='inherit-acl'
_pkgverUpstream="0.1.1"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Tool that applies to a path its parent directory's permissions and ACL"
arch=('any')
url='https://eomanis.duckdns.org/permshare/inherit-acl/'
license=('GPL3')
depends=('bash>=4.3' 'coreutils' 'sed' 'acl')
optdepends=('sudo: Sudo integration')
source=("https://eomanis.duckdns.org/permshare/inherit-acl/inherit-acl-${_pkgverUpstream}.tar.gz")
sha384sums=('ece6bd69da7efb8535978ff31124c95589f3e7d2f42ad5aa9c2306b8aa442c3681f90160d0e186a4e8c671f6067df0c8')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"
    
    # Place the main bash scripts into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/inherit-acl"
    chmod u=rwx,go=rx "inherit-acl"
    cp -t . "${srcRootDir}/inherit-acl-run"
    chmod u=rwx,go=rx "inherit-acl-run"
}
