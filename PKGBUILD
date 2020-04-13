# Maintainer: Sean Greenslade <aur AT seangreenslade DOT com>

pkgname=mail-on-err
pkgver=0.1
pkgrel=1
pkgdesc="Helper to email an error message when a systemd unit fails"
arch=('any')
url=""
license=('Unlicense')
depends=('nullmailer')
source=("https://seangreenslade.com/projects/$pkgname/releases/${pkgname}_${pkgver}.tar.gz")
sha512sums=('e000ee7bd64fa63b08bd9f9da601fabd297d77029466ec654a102b1f70ba40d785f0be336f45b9e677b2014789d208638ee22ddef031973daba66cc646f24217')

package() {
  cd "$srcdir"
  install -Dm755 mail-on-err.sh "$pkgdir/usr/lib/sd-helpers/mail-on-err.sh"
  install -Dm644 mail-on-err@.service "$pkgdir/usr/lib/systemd/system/mail-on-err@.service"
}

# vim:set ts=2 sw=2 et:
