# Maintainer: Md. Jahidul Hamid <jahidulhamid@yahoo.com>
pkgname=chibu
pkgver=1.0.2
pkgrel=1
pkgdesc="Create Hybrid ISO Bootable USB"
download_branch=release
arch=(any)
url="https://github.com/neurobin/chibu"
license=('BSD')
depends=(python systemd syslinux)
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
