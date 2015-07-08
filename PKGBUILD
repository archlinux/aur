# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>

# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=vtigercrm-customerportal
pkgver=6.2.0
pkgrel=1
pkgdesc="Customer portal for vTigerCRM"
arch=(any)
url="https://www.vtiger.com/open-source"
license=('custom')
depends=('vtigercrm')
backup=("srv/http/vtigercrm/portal/PortalConfig.php")
options=('!strip')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/vtigercrm/vtiger%20CRM%20$pkgver/Add-ons/$pkgname-$pkgver.zip")
md5sums=('1c8b98b9a8832c07694e5ce17230d2c9')

package() {
  _INSTDIR="${pkgdir}/srv/http/vtigercrm/portal"
  
  # Install 
  msg "Installing files to $_INSTDIR then setting ownership and permissions"
  install -dm755 $_INSTDIR
  cp -ra $srcdir/vtigercrm-customerportal-$pkgver*/* $_INSTDIR
  chown -R 33:33 $_INSTDIR
  chmod -R u=rwX,go=rX $_INSTDIR
}

# vim:set ts=2 sw=2 et:
