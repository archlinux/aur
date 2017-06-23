# Maintainer:  Novikov Maxim <m.novikov@newcontact.su>

pkgname=nausoftphone-plugin-cef
_pkgname=naumen
pkgver=6.3.20.41
pkgrel=1
pkgdesc="Naumen SoftPhone CEF plugin. Software Phone from Naumen ISC"
arch=('x86_64')
license=('Commercial')
depends=('bash' 'nausoftphone>=6.3.' 'alsa-lib>=1.0.16' 'boost' 'bzip2' 'gcc-libs>=4.6' 'glibc>=2.16' 'hicolor-icon-theme' 'hplip' 
	'krb5>=1.10.' 'libidn>=1.13' 'libldap>=2.4.7' 'libpulse>=0.99.1' 'libtiff>=4.0.3' 'zlib>=1.1.4'
)
optdepends=('haveged: boost low entropy')
makedepends=()
provides=('nausoftphone-plugin-cef')
source=("manual://nausoftphone-plugin-cef_6.3.20.41-1463657700-trusty_amd64.deb")
sha256sums=('9298df3029c330e8f02ed1b6b2192d0f001b591af72103a9e245ac12e8714b79')

package() {
  tar xf ${srcdir}/data.tar.xz

  # Clear
  unlink ${srcdir}/control.tar.gz
  unlink ${srcdir}/data.tar.xz
  unlink ${srcdir}/debian-binary
  unlink ${srcdir}/nausoftphone-plugin-cef_6.3.20.41-1463657700-trusty_amd64.deb

  # Install
  install -d -m 755 ${pkgdir}/opt/
  install -d -m755 ${pkgdir}/opt/naumen/nausoftphone6

  cp -a ${srcdir}/opt/${_pkgname}/nausoftphone/* $pkgdir/opt/${_pkgname}/nausoftphone6/
}
