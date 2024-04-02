# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=valaotp-git
_pkgname=valaotp
pkgver=1
pkgrel=4
pkgdesc="Vala app that parse the otpauth url parameter and call oathtool for generate an otp"
arch=('any')
url="https://github.com/BlackCodec/valaotp/"
license=('GPL')
makedepends=('vala')
depends=('oath-toolkit')
source=("https://github.com/BlackCodec/$_pkgname/archive/refs/heads/main.zip")
sha256sums=('SKIP')

package() {
   cd $srcdir/$_pkgname-main/
   make build
   install -Dm 755 "$srcdir/$_pkgname-main/otptool" "$pkgdir/usr/local/bin/otptool"
   install -Dm 755 "$srcdir/$_pkgname-main/otp.bash" "$pkgdir/usr/lib/password-store/extensions/otp.bash"
}

