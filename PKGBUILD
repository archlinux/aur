# Maintainer: Anton Semjonov < a**** \ät semjonov.de >

pkgname="mksignkernels"
pkgdesc="Bundle and sign your kernel for SecureBoot-enabled systems."

pkgver=0.0.5
pkgrel=1

arch=('any')
url="https://github.com/ansemjo/$pkgname"
license=('MIT')

depends=('systemd' 'bash' 'make' 'sed' 'binutils' 'sbsigntools')
makedepends=('make')

provides=($pkgname)
conflicts=($pkgname)
backup=("etc/$pkgname.mk")

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2004795bbcf3b00d0bd39c2454d93126f4bfd71c960cff4f72ada515fb74fd09')

package() {
  cd "$pkgname-$pkgver/"
	make -f install.mk DESTDIR="$pkgdir/" install
}

