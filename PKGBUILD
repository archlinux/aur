# Maintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>

pkgname=nomachine
pkgver=4.6.4
pkgrel=13
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
                pkgrel=13
                sha256sum_x86_64=('9e009ac13007d5063d25c096c4dfe0144e4ec19d8e752fa5dbd0151caf06b48b')
                source_x86_64=("http://download.nomachine.com/download/4.6/Linux/${pkgname}_${pkgver}_${pkgrel}_${_pkgarch}.tar.gz")
                ;;
        i686)   _pkgarch="i686"
                pkgrel=16
                sha256sum_i686=('40c26640648bdce236e1ec327f66bc1bfdafc33c4216a0c6320567c5aaa88c14')
                source_i686=("http://download.nomachine.com/download/4.6/Linux/${pkgname}_${pkgver}_${pkgrel}_${_pkgarch}.tar.gz")
                ;;
esac

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

