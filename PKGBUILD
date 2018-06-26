# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >
# Many options will remain here as leftovers in case the packaging in Github resumes once again

pkgname=pia-manager
pkgver=1.0.6
pkgrel=1
pkgdesc="Easily configure your Private Internet Access VPN"
arch=('any')
#url="https://github.com/linuxmint/pia-manager"
url="http://packages.linuxmint.com/pool/main/p/${pkgname}"
license=('GPL')
depends=('networkmanager-openvpn' 
    'networkmanager'
    'openvpn'
    'python'
    'python-setproctitle')
optdepends=('easy-rsa: easy CA and certificate handling')
#source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('d448e980b384cd603a5c687cd3cd43421f0df09274493329030eaa9370074480')

## Packaging via Linuxmint repository
build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  cp -r usr "$pkgdir"
}

## Packaging via Github
#build() {
#  cd ${pkgname}-${pkgver}
#  make
#}

#package() {
#  cd ${pkgname}-${pkgver}
#  cp -r usr "$pkgdir"
#}
