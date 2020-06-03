# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=psi-notify
pkgver=1.2.0
pkgrel=1
pkgdesc='Minimalistic PSI notifier using libnotify'
url="https://github.com/cdown/psi-notify"
license=('MIT')
depends=('libnotify')
arch=('x86_64' 'i686' 'arm')
source=("https://github.com/cdown/psi-notify/archive/$pkgver.tar.gz")
md5sums=('a1d1ba3e7aa5392eb2044dac9c0921ec')

build() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make
}

package() {
    mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/lib/systemd/user
    cp -a "${srcdir?}/$pkgname-$pkgver"/psi-notify "$pkgdir"/usr/bin
    cp -a "${srcdir?}/$pkgname-$pkgver"/psi-notify.service \
	"$pkgdir"/usr/lib/systemd/user

    install -Dm644 "${srcdir?}/$pkgname-$pkgver"/LICENSE \
	"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
