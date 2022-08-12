# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=psi-notify
pkgver=1.3.1
pkgrel=1
pkgdesc='Minimalistic PSI notifier using libnotify'
url="https://github.com/cdown/psi-notify"
license=('MIT')
depends=('libnotify' 'systemd-libs')
arch=('x86_64' 'i686' 'arm')
source=("https://github.com/cdown/psi-notify/archive/$pkgver.tar.gz")
md5sums=('46d89bf909a30fdf5c2c445d24462be9')

build() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make prefix="/usr"
}

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make prefix="/usr" DESTDIR="$pkgdir/" install
}
