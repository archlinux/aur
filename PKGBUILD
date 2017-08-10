pkgname=pass-botp
pkgver=1.0.0.r0.g06518a4
pkgrel=1
pkgdesc="A pass extension for managing TOTP Backup Codes"
arch=(any)
url="https://github.com/msmol/pass-botp"
license=('GPL2')
depends=('pass')
makedepends=('git')
source=("git+https://github.com/msmol/$pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r "s/^v//;s/([^-]*-g)/r\1/;s/-/./g"
}

package() {
    install -Dm755 "$srcdir/pass-botp/src/botp.bash" "$pkgdir/usr/lib/password-store/extensions/botp.bash"
}
