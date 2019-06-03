# Maintainer: eomanis at web dot de

pkgname='inherit-acl'
_pkgverUpstream="0.1.2"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Tool that applies to a path its parent directory's permissions and ACL"
arch=('any')
url='https://eomanis.duckdns.org/permshare/inherit-acl/'
license=('GPL3')
depends=('bash>=4.3' 'coreutils' 'sed' 'acl')
optdepends=('sudo: Sudo integration')
source=("https://eomanis.duckdns.org/permshare/inherit-acl/inherit-acl-${_pkgverUpstream}.tar.gz")
sha384sums=('e5cf2b25a1ba03ad1a05c941a51d5f3214dd7a09fa28c5eb47a5e4217c8e2cdf28e846b19d55c691cfa0fbb8762b24ef')

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
