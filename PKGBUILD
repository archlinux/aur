# Maintainer: Schrottfresse <schrottfresse@gmx.de>

pkgname=shelldap
pkgver=1.5.2
pkgrel=1
pkgdesc="A handy shell-like interface for browsing LDAP servers and editing their content."
arch=('any')
url="https://code.martini.nu/fossil/shelldap"
license=('BSD')
depends=('perl' 'perl-yaml-syck' 'perl-digest-perl-md5' 'perl-ldap' 'perl-algorithm-diff' 'perl-term-readkey' 'perl-term-readline-gnu' 'perl-term-shell' 'perl-tie-ixhash')
makedepends=()
optdepends=('perl-io-socket-ssl: for use with ldaps:// servers'
            'perl-authen-sasl: SASL authentication')
provides=('shelldap')
source=("https://github.com/mahlonsmith/shelldap/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('9d4cffbdca31fb1282615c3575201d94fc3b43ca653821d37b120c95f9cd2e1c'
            'b180006176b4caf900df38b3365b09413f8783478fae8bcb8f73b6cb794a4116')

package() {
  cd "$pkgname-$pkgver"
  install -m 644 -Dt "$pkgdir/usr/share/doc/$pkgname/" USAGE
  install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
  install -Dt "$pkgdir/usr/bin/" shelldap
}
