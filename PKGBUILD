# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='pia-manager'
pkgver='1.0.1'
pkgrel='1'
pkgdesc=' A VPN configuration tool for PIA'
arch=(any)
url="https://github.com/linuxmint/pia-manager"
license=('GPL')
depends=('gksu' 'networkmanager-openvpn' 'networkmanager' 'openvpn' 'python' 'python-setproctitle')
optdepends=("easy-rsa: easy CA and certificate handling")
source=("https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
    	#"org.pia-manager.policy)
sha256sums=('0b179b4d797505913e627c7840e6410610cd5ec4286211bcf1f3a11e95db2835')
			#'29ac7cb481565cca489075456b6fbb9dad084807b0ec373be2a76667d09bced9')

prepare() {
  cd ${pkgname}-${pkgver}
  # Changing gksu for pkexec
  #sed -i 's/gksu/pkexec/g' "${pkgdir}/usr/bin/pia-manager"
}

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cp -r usr "$pkgdir"
  #install -m644 "${srcdir}/org.x.lightdm-settings.policy" "${pkgdir}/usr/share/polkit-1/actions/"
}
