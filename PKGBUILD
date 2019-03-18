# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >
# Many options will remain here as leftovers in case the packaging in Github resumes once again

pkgname=pia-manager
pkgver=1.0.8
pkgrel=2
pkgdesc="Easily configure your Private Internet Access VPN"
arch=('any')
#url="https://github.com/linuxmint/pia-manager"
url="http://packages.linuxmint.com/pool/main/p/${pkgname}"
license=('GPL')
depends=('networkmanager-openvpn' 
    'networkmanager'
    'openvpn'
    'python'
    'python-gobject'
    'python-setproctitle')
optdepends=('easy-rsa: easy CA and certificate handling')
#source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('81cd143e9b3f9b19765239861f1af32fbff06b57bde7df7b2901d8f5d84defc9')

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
