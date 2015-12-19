pkgname=pam_rundir
pkgver=1.0.0
pkgrel=1
pkgdesc='PAM module to provide $XDG_RUNTIME_DIR'
arch=('i686' 'x86_64')
url="http://jjacky.com/pam_rundir"
license=('GPL2+')
depends=("pam")
source=("http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c779b699ed23777a3bdba87b7f67ed395fe957f3c96138faee45f87a27bcc020')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
