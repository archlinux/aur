# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=psi-notify
pkgver=1.0.0
pkgrel=1
pkgdesc='Minimalistic PSI notifier using libnotify'
url="https://github.com/cdown/psi-notify"
license=('MIT')
depends=('libnotify')
arch=('any')
source=("https://github.com/cdown/psi-notify/archive/$pkgver.tar.gz")
md5sums=('edbaa31e34b4711cc40e750d18f4d73b')

build() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make
}

package() {
    mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/lib/systemd/user
    cp -a "${srcdir?}/$pkgname-$pkgver"/psi-notify "$pkgdir"/usr/bin
    cp -a "${srcdir?}/$pkgname-$pkgver"/psi-notify.service \
	"$pkgdir"/usr/lib/systemd/user
}
