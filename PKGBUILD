# Maintainer: Md. Jahidul Hamid <jahidulhamid@yahoo.com>
pkgname=gencsr
pkgver=0.0.3
pkgrel=1
pkgdesc="Simple CSR generator"
arch=(any)
url="https://github.com/neurobin/gencsr"
license=('BSD')
depends=(bash openssl)
source=( "https://github.com/neurobin/$pkgname/archive/release.tar.gz" )
md5sums=('SKIP')
download_branch=release

pkgver() {
  cd "${srcdir}/gencsr-$download_branch"
  ./gencsr -v | grep -P 'Version:.*' |grep -oP '[\d.]+$'
}


package() {
	cd "$pkgname-$download_branch"
	make DESTDIR="$pkgdir/" install
}
