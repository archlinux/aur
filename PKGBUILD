# Maintainer: crave <crave@invalid.org>

_pkgname=ledger2beancount
pkgname="${_pkgname}-git"
pkgver=1.7
pkgrel=1
pkgdesc='Ledger to Beancount text-based converter'
arch=('any')
url="https://github.com/zacchiro/ledger2beancount"
license=('GPL')
depends=('perl' 'perl-carp-assert' 'perl-config-onion' 'perl-date-calc'
         'perl-datetime-format-strptime' 'perl-file-basedir'
         'perl-getopt-long-descriptive' 'perl-yaml-libyaml')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 bin/ledger2beancount "${pkgdir}/usr/bin/ledger2beancount"
  install -Dm755 bin/ledger2beancount-ledger-config "${pkgdir}/usr/bin/ledger2beancount-ledger-config"
  install -Dm644 ledger2beancount.yml "${pkgdir}/usr/share/doc/ledger2beancount/ledger2beancount.yml"
}
