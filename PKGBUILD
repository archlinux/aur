# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.0.2
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="http://packages.linuxmint.com/pool/main/l/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'lightdm' 'lsb-release' 'python-setproctitle' 'lightdm-slick-greeter' 'gksu')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
		#"org.x.lightdm-settings.policy")
sha256sums=('3ba404c48368d5f05ecd4e1da6a08dcb130bccc0fc9cb19a653c4fb345081dd7')
			#'29ac7cb481565cca489075456b6fbb9dad084807b0ec373be2a76667d09bced9')

prepare() {
  cd ${pkgname}
  # Changing gksu for pkexec
  #sed -i 's/gksu/pkexec/g' "${pkgdir}/usr/bin/lightdm-settings"
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  cp -r usr "$pkgdir"
  #install -m644 "${srcdir}/org.x.lightdm-settings.policy" "${pkgdir}/usr/share/polkit-1/actions/"
}
