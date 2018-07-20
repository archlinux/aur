# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Stefan J. Betz <info@stefan-betz.net>
pkgname='pius'
pkgver='2.2.6'
pkgrel=1
pkgdesc='PGP Individual UID Signer (PIUS)'
arch=('any')
url='https://www.phildev.net/pius/'
license=('GPL2')
install="$pkgname.install"
depends=('python')
optdepends=('python-pexpect: interactive mode support')
source=("https://github.com/jaymzh/pius/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "https://github.com/jaymzh/pius/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2.asc")
validpgpkeys=('121BDA2D4ACB63616B367A0E58E11BB1E414D9AD')
sha256sums=('d27d744e90724ba161fd61554f7847a93260b366886c9c1b1167ffd1ef8723a1'
            'SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  for f in README.md README-keyring-mgr.md README-report.md
  do
    install -Dm644 "$f" "$pkgdir/usr/share/doc/pius/$f"
  done
}
