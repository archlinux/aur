# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=psi-notify
pkgver=1.0.1
pkgrel=1
pkgdesc='Minimalistic PSI notifier using libnotify'
url="https://github.com/cdown/psi-notify"
license=('MIT')
depends=('libnotify')
arch=('x86_64' 'i686' 'arm')
source=("https://github.com/cdown/psi-notify/archive/$pkgver.tar.gz")
md5sums=('f21219ea92214dfe0658d999255cd4d8')

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
