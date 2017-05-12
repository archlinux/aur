# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='pia-manager'
pkgver='1.0.2'
pkgrel='1'
pkgdesc=' A VPN configuration tool for PIA'
arch=(any)
url="https://github.com/linuxmint/pia-manager"
license=('GPL')
depends=('gksu' 'networkmanager-openvpn' 'networkmanager' 'openvpn' 'python' 'python-setproctitle')
optdepends=("easy-rsa: easy CA and certificate handling")
source=("https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('167068c832d6cf998c8e3f9d6c938442b8bb0ff6df192076aef70eceba02ef85')

prepare() {
  cd ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cp -r usr "$pkgdir"
}
