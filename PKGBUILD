# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>

pkgname=nomachine
pkgver=4.6.16
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
		sha256sums=('4c1abc76d844f04f24e5fadf06bb720275dacd3e71aacceb6380bc8755a0f996')
                source=("http://download.nomachine.com/download/4.6/Linux/${pkgname}_${pkgver}_${pkgrel}_${_pkgarch}.tar.gz")
                ;;
        i686)   _pkgarch="i686"
		pkgrel=1
		sha256sums=('c55dcdc895f4427bc5d988467d8313ee2c0678caca6b3913ed53d5b247c3142f')
                source=("http://download.nomachine.com/download/4.6/Linux/${pkgname}_${pkgver}_${pkgrel}_${_pkgarch}.tar.gz")
                ;;
esac

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

