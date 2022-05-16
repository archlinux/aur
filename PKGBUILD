# Maintainer: zneix <zneix@zneix.eu>

pkgname=pass-otp-git
pkgver=1.2.0.r29.ga364d2a
pkgrel=2
pkgdesc='A pass extension for managing one-time-password (OTP) tokens.'
arch=('any')
url=https://github.com/tadfisher/pass-otp
license=('GPL3')
depends=()
makedepends=('git' 'make')
provides=('pass-otp')
conflicts=('pass-otp')
options=()
source=('pass-otp::git+https://github.com/tadfisher/pass-otp.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/pass-otp"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/pass-otp"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
