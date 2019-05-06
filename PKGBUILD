# Maintainer: eomanis at web dot de

pkgname='inherit-acl'
_pkgverUpstream="0.1.0"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=2
pkgdesc="Tool that applies to a path its parent directory's permissions and ACL"
arch=('any')
url='https://eomanis.duckdns.org/permshare/inherit-acl/index.xhtml'
license=('GPL3')
depends=('bash>=4.3' 'coreutils' 'sed' 'acl')
optdepends=('sudo: Sudo integration')
source=("https://eomanis.duckdns.org/permshare/inherit-acl/inherit-acl-${_pkgverUpstream}.tar.gz")
sha384sums=('f3417fa441abd1a1cc44cb0f3897fd29bb850f72688708bf7792a9f4abb67c8d12a7d2aa3b95026dfe5254b31d48e56e')

package() {
    
    # Place the main bash scripts into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcdir}/inherit-acl"
    chmod u=rwx,go=rx "inherit-acl"
    cp -t . "${srcdir}/inherit-acl-run"
    chmod u=rwx,go=rx "inherit-acl-run"
}
