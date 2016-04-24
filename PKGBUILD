# Maintainer: MissingNoIOI <missingno@akuma.pictures>

pkgname=yafc
pkgver=1.3.7
pkgrel=3
pkgdesc="Yet Another FTP Client for the console"
arch=('i686' 'x86_64')
url="http://yafc-ftp.com/"
license=('GPL')
depends=('libbsd')
makedepends=('krb5' 'readline' 'libssh')
optdepends=("krb5: required for Kerberos 5 support"
            "readline: required for tab completion and history support"
            "libssh: required for scp and sftp support")
source=(http://www.yafc-ftp.com/downloads/$pkgname-$pkgver.tar.xz{,.asc})
sha512sums=('2547cf3d6f1918a5cd2d3bc29455311d48fcd7dbccfdc8ae4ce08d1fd63cfabae07b70ebf005206a61937bd5b686e19d3af095f876616a5ac4b0593e90cd39c5'
            'SKIP')

validpgpkeys=('F78CBA07817BB149A11D339069F2FC516EA71993') # Sebastian Ramacher


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
