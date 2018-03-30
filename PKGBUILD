# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=ledger2beancount
pkgver=1.0
pkgrel=2
pkgdesc='Ledger to Beancount text-based converter'
arch=('any')
url="https://github.com/zacchiro/ledger2beancount"
license=('GPL')
depends=('perl' 'perl-carp-assert' 'perl-config-onion' 'perl-date-calc'
         'perl-datetime-format-strptime' 'perl-file-basedir'
         'perl-getopt-long-descriptive' 'perl-yaml-libyaml')
source=("https://github.com/zacchiro/ledger2beancount/archive/${pkgver}.tar.gz")
sha256sums=('14fd98c8d1c8021147a7e241df97216e9f9ab81ad4d075de9d0d006e69a043a6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/ledger2beancount "${pkgdir}/usr/bin/ledger2beancount"
  install -Dm755 bin/ledger2beancount-ledger-config "${pkgdir}/usr/bin/ledger2beancount-ledger-config"
  install -Dm644 ledger2beancount.yml "${pkgdir}/usr/share/doc/ledger2beancount/ledger2beancount.yml"
}
