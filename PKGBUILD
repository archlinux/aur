# Maintainer: Schrottfresse <schrottfresse@gmx.de>

pkgname=shelldap
pkgver=1.5.1
pkgrel=1
pkgdesc="A handy shell-like interface for browsing LDAP servers and editing their content."
arch=('any')
url="http://code.martini.nu/shelldap"
license=('BSD')
depends=('perl' 'perl-yaml-syck' 'perl-digest-perl-md5' 'perl-ldap' 'perl-algorithm-diff' 'perl-term-readkey' 'perl-term-readline-gnu' 'perl-term-shell')
makedepends=()
optdepends=('perl-io-socket-ssl: for use with ldaps:// servers'
            'perl-authen-sasl: SASL authentication')
provides=('shelldap')
source=("https://github.com/mahlonsmith/shelldap/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('91889c277e9c7dd470abf017ac73c02ab2a95aac355de4dd7c77f0c7fadef31d'
            'b180006176b4caf900df38b3365b09413f8783478fae8bcb8f73b6cb794a4116')

package() {
  cd "$pkgname-$pkgver"
  install -m 644 -Dt "$pkgdir/usr/share/doc/$pkgname/" USAGE README.md CHANGELOG CONTRIBUTORS
  install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
  install -Dt "$pkgdir/usr/bin/" shelldap
}
