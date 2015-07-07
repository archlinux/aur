# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributer: Jamie Nguyen <jamie tomoyolinux co uk>

pkgname=obdevicemenu
pkgver=1.7.0
pkgrel=1
pkgdesc="An Openbox pipe menu for the management of removable media with Udisks"
arch=('any')
url='http://www.sourceforge.net/projects/obdevicemenu/'
license=('GPL2')
depends=('openbox' 'udisks')
optdepends=('notification-daemon: for desktop notifications')
install=${pkgname}.install
backup=('etc/obdevicemenu.conf')
source=("obdevicemenu.conf" "obdevicemenu")
md5sums=('8ce46d49d8db1cdab2128f02b96828e8'
         'f2c54d75a51db6c077eb82e144d23d57')

# sources went missing :(
#source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
#sha256sums=('724f9dfc705f0c9c4b317c7c017491a6e763252a7837255aff511fe4857647ce')

package()
{
  #cd "${srcdir}/obdevicemenu-${pkgver}"
	
  # install script
  install -d -m755 "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}"/obdevicemenu "${pkgdir}/usr/bin/obdevicemenu"

  # install config file
  install -d -m755 "${pkgdir}/etc/"
  install -m644 "${srcdir}"/obdevicemenu.conf "${pkgdir}/etc/obdevicemenu.conf"
}

