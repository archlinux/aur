# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=ledger2beancount
pkgver=1.1
pkgrel=1
pkgdesc='Ledger to Beancount text-based converter'
arch=('any')
url="https://github.com/zacchiro/ledger2beancount"
license=('GPL')
depends=('perl' 'perl-carp-assert' 'perl-config-onion' 'perl-date-calc'
         'perl-datetime-format-strptime' 'perl-file-basedir'
         'perl-getopt-long-descriptive' 'perl-yaml-libyaml')
source=("https://github.com/zacchiro/ledger2beancount/archive/${pkgver}.tar.gz")
sha256sums=('fc4e07f101529f81640636ba0933701bd1f88ceae17cede0f8484049b96eb9c3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/ledger2beancount "${pkgdir}/usr/bin/ledger2beancount"
  install -Dm755 bin/ledger2beancount-ledger-config "${pkgdir}/usr/bin/ledger2beancount-ledger-config"
  install -Dm644 ledger2beancount.yml "${pkgdir}/usr/share/doc/ledger2beancount/ledger2beancount.yml"
}
