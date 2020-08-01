# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: liupold <rohhnch@protonmail.ch>

pkgname=pidswallow
pkgrel=2
pkgver=1.0
pkgdesc="A script to swallow your terminal automatically"
arch=(x86_64)
url="https://github.com/Liupold/pidswallow"
license=('APACHE')
depends=(xdotool)
makedepends=(git)
checkdepends=(shellcheck)
provides=(pidswallow)

source=("$pkgname-$pkgver::https://github.com/Liupold/pidswallow/archive/1.0.tar.gz")
sha256sums=("1ad08b49c9a9502bff47fd58df8b5a06252f7d349a8cdf4105932a77232adb69")


check() {
        cd "$pkgname-$pkgver" || return 1
        shellcheck "./pidswallow"
}

package() {
        cd "$pkgname-$pkgver" || return 1
        install -Dm755 "./pidswallow" "$pkgdir/usr/bin/pidswallow"
        install -Dm644 "./README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
