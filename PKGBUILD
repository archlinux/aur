
pkgname=pymodoro
pkgver=1
pkgrel=2
pkgdesc="A very smol pomodoro timer written in python 3"
arch=('any')
license=('GPL-2.0-or-later')
depends=('libnotify' 'python')
makedepends=('git')
url="https://github.com/coodos/pymodoro"
source=("git+${url}#commit=e2b7483744609b497c54535fa01c9264713058c0")
sha256sums=('11241442635d52c6083b79ea1cb9b4a57ca056004d101d3b40e2d4c068b2512a')

prepare() {
    sed -i '1i #!/usr/bin/env python' "$pkgname/main.py"
}

package() {
    install -Dm755 "$pkgname/main.py" "$pkgdir/usr/bin/$pkgname"
}
