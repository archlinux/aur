# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=swhkd-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='A display server independent hotkey daemon inspired by sxhkd'
arch=(x86_64)
url='https://github.com/waycrate/swhkd'
license=(BSD)
depends=(polkit)
provides=(swhkd)
conflicts=(swhkd-git swhkd-musl-git)
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/glibc-x86_64-$pkgver.zip"
        'https://raw.githubusercontent.com/waycrate/swhkd/19db3259a5f24e3c4395bbfeb3cfad8709d14f18/com.github.swhkd.pkexec.policy')
sha256sums=('6a53e359754971d041f759efb64e1b12c495158f8ea6d36ed9a49c45cc35b15f'
            '3eee83632e7a8c2fb9d1fb7748af0d49739f9585df0e5d4f8d0249ef4594ec47')

package() {
    install -Dm 755 swhkd "$pkgdir/usr/bin/swhkd"
    install -Dm 755 swhks "$pkgdir/usr/bin/swhks"

    install -Dm 644 com.github.swhkd.pkexec.policy -t "$pkgdir/usr/share/polkit-1/actions"
}
