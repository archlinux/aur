# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=valaotp-git
_pkgname=valaotp
pkgver=1
pkgrel=1
pkgdesc="Vala app that parse the otpauth url parameter and call oathtool for generate an otp"
arch=('any')
url="https://github.com/BlackCodec/valaotp/"
license=('GPL')
depends=('oath-toolkit')
source=("https://github.com/BlackCodec/$_pkgname/archive/refs/heads/main.zip")
sha256sums=('02d5a8d448a937948bb6952db338815ca89d70000b9c412619fc94d0ea3add09')

package() {
   cd $srcdir/$_pkgname-main/
   make build
   install -Dm 755 "$srcdir/$_pkgname-main/otptool" "$pkgdir/usr/local/bin/otptool"
}

