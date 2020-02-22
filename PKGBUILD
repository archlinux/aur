# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=ledger2beancount
pkgver=2.0
pkgrel=1
pkgdesc='Ledger to Beancount text-based converter'
arch=('any')
url="https://github.com/zacchiro/ledger2beancount"
license=('GPL')
depends=('perl' 'perl-config-onion' 'perl-date-calc'
         'perl-datetime-format-strptime' 'perl-file-basedir'
         'perl-getopt-long-descriptive' 'perl-string-interpolate' 'perl-yaml-libyaml')
conflicts=('ledger2beancount-git')
source=("https://github.com/zacchiro/ledger2beancount/archive/${pkgver}.tar.gz")
sha256sums=('6f14cf8b0caa04834c61ad80bda09250ea671e11e5d76c9eb7ad7fc7eb26325d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/ledger2beancount "${pkgdir}/usr/bin/ledger2beancount"
  install -Dm755 bin/ledger2beancount-ledger-config "${pkgdir}/usr/bin/ledger2beancount-ledger-config"
  install -Dm644 ledger2beancount.yml "${pkgdir}/usr/share/doc/ledger2beancount/ledger2beancount.yml"
}
