# Maintainer: Anton Semjonov < a**** \ät semjonov.de >

pkgname="mksignkernels"
pkgdesc="Bundle and sign your kernel for SecureBoot-enabled systems."

pkgver=0.0.4
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
sha256sums=('14f986d045bfd577b903db7ebe54aa0fe20e3fbcd9e3aec8caba518e7097b2a0')

package() {
  cd "$pkgname-$pkgver/"
	make -f install.mk DESTDIR="$pkgdir/" install
}

