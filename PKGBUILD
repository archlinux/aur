# Maintainer: Md. Jahidul Hamid <jahidulhamid@yahoo.com>
pkgname=gencsr
pkgver=0.0.4
pkgrel=1
pkgdesc="Simple CSR generator"
download_branch=release
arch=(any)
url="https://github.com/neurobin/gencsr"
license=('BSD')
depends=(bash openssl)
source=( "https://github.com/neurobin/$pkgname/archive/$download_branch.tar.gz" )
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/$pkgname-$download_branch"
  ./$pkgname -v | grep -P 'Version:.*' |grep -oP '[\d.]+$'
}


package() {
	cd "$pkgname-$download_branch"
	make DESTDIR="$pkgdir/" install
}
