# Maintainer: Sofiane Hamlaoui <s0fianehaml40u1 at gmail dot com>

pkgname=lockdoor
_pkgname=lockdoor-framework
pkgver=2.2.4
pkgrel=1
pkgdesc="A penetration testing framework with cyber security resources"
url="http://github.com/SofianeHamaloui/Lockdoor-Framework"
arch=('any')
license=('GPL3')
depends=('python' 'python-pip' 'python-requests' 'python2' 'python2-pip' 'gcc' 'ruby' 'php' 'git' 'wget' 'curl' 'netcat' 'subversion' 'jre-openjdk' 'make' 'automake' 'gcc' 'linux-headers' 'gzip'  'rsync' 'wget')
optdepends=()
optdepends=()
makedepends=()
provides=('openra-ca')
options=(!strip)
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Lockdoor-Framework/Lockdoor-Framework")
sha256sums=(SKIP)

pkgver() {
    ver=$(curl -s -L https://raw.githubusercontent.com/SofianeHamlaoui/Lockdoor-Framework/master/VERSION)
    printf "$ver" 
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/lockdoor" "${pkgdir}/usr/bin/lockdoor"
    mkdir -p ${pkgdir}/usr/bin/lockdoors
    rsync -a "${srcdir}/${_pkgname}/lockdoors" "${pkgdir}/usr/bin/"
    mkdir -p ${pkgdir}/opt/sofiane/
    rsync -a "${srcdir}/${_pkgname}/pentest" "${pkgdir}/opt/sofiane/"
}  
