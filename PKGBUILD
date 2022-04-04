# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=swhkd-bin
pkgver=1.1.7
pkgrel=2
pkgdesc='A display server independent hotkey daemon inspired by sxhkd'
arch=(x86_64)
url='https://github.com/waycrate/swhkd'
license=(BSD)
depends=(polkit)
provides=(swhkd)
conflicts=(swhkd-git swhkd-musl-git)
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/glibc-x86_64-$pkgver.zip"
        'https://raw.githubusercontent.com/waycrate/swhkd/fb52e9f2a34c9f1c1f1f37a7ecc37493019a9e61/com.github.swhkd.pkexec.policy')
sha256sums=('2b293f6ee8486d5ab12f443fc7fef1b16a0891d6ae87f0f0138783a0182ad400'
            '3eee83632e7a8c2fb9d1fb7748af0d49739f9585df0e5d4f8d0249ef4594ec47')

package() {
    install -Dm 755 swhkd "$pkgdir/usr/bin/swhkd"
    install -Dm 755 swhks "$pkgdir/usr/bin/swhks"

    install -Dm 644 com.github.swhkd.pkexec.policy -t "$pkgdir/usr/share/polkit-1/actions"

    install -d -o root -m 700 "$pkgdir/etc/swhkd/runtime"
}
