# Maintainer: Sofiane Hamlaoui <s0fianehaml40u1 at gmail dot com>

pkgname=lockdoor-git
_pkgname=lockdoor-framework
pkgver=2.2.4
pkgrel=1
pkgdesc="A penetration testing framework with cyber security resources"
url="http://github.com/SofianeHamlaoui/Lockdoor-Framework"
arch=('any')
license=('GPL3')
depends=('python' 'python-pip' 'python-requests' 'python2' 'python2-pip' 'ruby' 'php' 'git' 'wget' 'netcat' 'subversion' 'jre-openjdk' 'linux-headers' 'rsync')
optdepends=()
optdepends=()
makedepends=('git')
provides=('lockdoor-framework')
options=(!strip)
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Lockdoor-Framework/Lockdoor-Framework")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/lockdoor" "${pkgdir}/usr/bin/lockdoor"
    mkdir -p ${pkgdir}/usr/bin/lockdoors
    rsync -a "${srcdir}/${_pkgname}/lockdoors" "${pkgdir}/usr/bin/"
    mkdir -p ${pkgdir}/opt/sofiane/
    rsync -a "${srcdir}/${_pkgname}/pentest" "${pkgdir}/opt/sofiane/"
}  
