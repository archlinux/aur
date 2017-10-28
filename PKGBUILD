# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='pia-manager'
pkgver='1.0.5'
pkgrel='1'
pkgdesc=' A VPN configuration tool for PIA'
arch=(any)
url="https://github.com/linuxmint/pia-manager"
license=('GPL')
depends=('networkmanager-openvpn' 'networkmanager' 'openvpn' 'python' 'python-setproctitle')
optdepends=("easy-rsa: easy CA and certificate handling")
source=("https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3ca020ced645ad1982c62dbe59a5a977be48214448b58a23ff90d4cbdde86612')

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
