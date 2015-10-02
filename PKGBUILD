# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>

pkgname=nomachine
pkgver=5.0.43
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
install=nomachine.install

case "$CARCH" in
	x86_64) _pkgarch="x86_64"
		pkgrel=1
		sha512sums=('b07f74c5a30517ef1c3e196fa9702aacda069bebac5c3b1f4227eb306e14324dc9ed88eb4b129466e51a1247e5382f93f9cc209ecdbea354bc1bac5e0601cad4')
                source=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${pkgrel}_${_pkgarch}.tar.gz")
                ;;
        i686)   _pkgarch="i686"
		pkgrel=1
		sha512sums=('e47fe63fa31f50e0ec542deda2912986bca78aa70f93f68e9aa9519c68b956ac59c26df7c14a8225ed2ed6953bbf158f242971e8bfdfe5f5eabeafa67af0f399')
                source=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${pkgrel}_${_pkgarch}.tar.gz")
                ;;
esac

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

