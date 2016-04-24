# Contributor: Lex Black <autumn-wind at web dot de>
# Maintainer: dawidd6 <dawidd0811@gmail.com>

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
source=(http://yafc-ftp.com/upload/$pkgname-$pkgver.tar.xz{,.asc})
sha512sums=('3b72aa3d321f622fc68288c5a504110759ea403f07a1dadfef13bbf3831347992c725338269a6d7933d9d65d03eb6594ca6d7d4c771dad5ae598041779dee2d2'
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
