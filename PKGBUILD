# Maintainer: Dor Askayo <dor.askayo@gmail.com>

pkgname=steamrun
pkgver=0.3.0
pkgrel=1
pkgdesc='A simple script for executing programs in the Steam Runtime'
arch=(i686 x86_64)
url='https://github.com/doraskayo/steamrun'
license=('MIT')
depends=(gcc-libs
         libxcb
         libgpg-error
         steam)
source=("https://github.com/doraskayo/steamrun/archive/${pkgver}.tar.gz")
sha256sums=('33b7264485b2f65893f0d98c39fa5cc6cd9b50c1d28d5f00b4a1b4468ca3acc9')

package() {
    cd "$srcdir/steamrun-$pkgver"

    # Install the script
    install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install bash completion
    install -Dm644 "completions/$pkgname"                           \
        "$pkgdir/usr/share/bash-completion/completions/$pkgname"

    # Install the license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
