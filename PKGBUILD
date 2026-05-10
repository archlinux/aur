# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: zneix <zneix@zneix.eu>

_pkgname=pass-otp
pkgname=$_pkgname-git
pkgver=1.2.0.r39.g7bb50db
pkgrel=1
pkgdesc='A pass extension for managing one-time-password (OTP) tokens'
arch=(any)
url=https://github.com/tadfisher/pass-otp
license=(GPL3)

conflicts=($_pkgname)
provides=($_pkgname)
depends=(pass oath-toolkit qrencode)
makedepends=(git)
optdepends=('passage: a pass fork with age backend')
source=(git+$url)
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/pass-otp"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/pass-otp"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
