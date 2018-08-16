# Maintainer: eomanis at web dot de

pkgname='inherit-acl'
pkgverUpstream="0.1.0"
pkgver="${pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Tool that applies to a path its parent directory's permissions and ACL"
arch=('any')
url='http://eomanis.mooo.com/permshare/inherit-acl/index.xhtml'
license=('GPL3')
depends=('bash>=4.3' 'coreutils' 'sed' 'acl')
optdepends=('sudo: Sudo integration')
source=("http://eomanis.mooo.com/permshare/inherit-acl/inherit-acl-${pkgverUpstream}.tar.gz")
sha256sums=('8df51daec1129b9d683498b797465b41d1377adc26860381dc9820c2ba68970e')

package() {
    
    # Place the main bash scripts into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcdir}/inherit-acl"
    chmod u=rwx,go=rx "inherit-acl"
    cp -t . "${srcdir}/inherit-acl-run"
    chmod u=rwx,go=rx "inherit-acl-run"
}
