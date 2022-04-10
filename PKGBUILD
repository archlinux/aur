# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=showipatlogon
pkgname_link=showipatlogon
pkgbase=showipatlogon
pkgver=1
pkgrel=1
pkgdesc="Shows the IP address(es) of your NIC(s) via the /etc/issue file at logon"
url="https://github.com/Mordillo98/showipatlogon"
arch=('any')
provides=($pkgname)
conflicts=($pkgname)
depends=('net-tools' 'moreutils')
install=$pkgname.install
source=('https://sourceforge.net/projects/showipatlogon/files/showipatlogon.tar.xz' 'showipatlogon.install')
md5sums=('687f4a4db72df13ca62dc5ef1ae095d0'
	 '5ecbace16850d02bcaf4c1197fc16cb6')

package() {
  install -d /$pkgdir/opt/$pkgname

  cp $pkgname/* /$pkgdir/opt/$pkgname
  chmod +x /$pkgdir/opt/$pkgname/post_install-showipatlogon.sh
  chmod +x /$pkgdir/opt/$pkgname/pre_remove-showipatlogon.sh
  chmod +x /$pkgdir/opt/$pkgname/SETTINGS
  chmod +x /$pkgdir/opt/$pkgname/create-welcome
  chmod +x /$pkgdir/opt/$pkgname/showipatlogon.boot
  chmod +x /$pkgdir/opt/$pkgname/showipatlogon.postboot
}
