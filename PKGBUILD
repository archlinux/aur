# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

_model_name=talon-w2l-small3-dslm-en_US
pkgname=talon-wav2letter-bin
pkgver=0.1.r1
pkgrel=1
pkgdesc="Voice recognition model for Talon"
arch=("x86_64")
url="https://talonvoice.com/"
license=("custom")
depends=()
provides=("talon-wav2letter")
conflicts=("talon-wav2letter")
source=("https://talonvoice.com/dl/$_model_name.zip")
b2sums=("34608eb13260ad88baa65faa875e29808ff30be56ae90298ca2d081181cd90a26d2c1f126dd605467f18245136b962ee0e2db17139392a37a44c6a9bc46301ec")

package() {
  mkdir -p "$pkgdir/usr/share/talon/models"
  cp -r "$srcdir/$_model_name" "$pkgdir/usr/share/talon/models/"

  install -Dm644 "$srcdir/$_model_name/README" "/usr/share/doc/$pkgname/$_model_name/README"
}
