pkgbase=hyper-bin
pkgname=("hyper-bin" "hyperstart-bin")
pkgver=0.5
pkgrel=1
pkgdesc="A hypervisor-agnostic Docker runtime"
url="https://hyper.sh"
arch=("any")
license=("Apache")
depends=("automake" "cpio" "device-mapper" "sqlite" "qemu")
makedepends=("rpmextract")
#optdepends=("")
#backup=("")
source=("hyper-$pkgver.rpm::https://s3.amazonaws.com/hyper-install/hyper-$pkgver-1.fc23.x86_64.rpm"
        "hyperstart-$pkgver.rpm::https://s3.amazonaws.com/hyper-install/hyperstart-$pkgver-1.fc23.x86_64.rpm")
md5sums=('efc2c8e6945673ff0048a3b0fa579231'
         '6a1c80a26ecc96fa2bfbc81a613c5482')

package_hyper-bin() {
	cd "$pkgdir"
	rpmextract.sh "$srcdir/hyper-$pkgver.rpm"
	mv "$pkgdir/lib/" "$pkgdir/usr/lib/"
}

package_hyperstart-bin() {
	cd "$pkgdir"
	rpmextract.sh "$srcdir/hyperstart-$pkgver.rpm"
}
