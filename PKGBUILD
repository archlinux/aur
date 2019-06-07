# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=ledger2beancount
pkgver=1.7
pkgrel=1
pkgdesc='Ledger to Beancount text-based converter'
arch=('any')
url="https://github.com/zacchiro/ledger2beancount"
license=('GPL')
depends=('perl' 'perl-carp-assert' 'perl-config-onion' 'perl-date-calc'
         'perl-datetime-format-strptime' 'perl-file-basedir'
         'perl-getopt-long-descriptive' 'perl-string-interpolate' 'perl-yaml-libyaml')
source=("https://github.com/zacchiro/ledger2beancount/archive/${pkgver}.tar.gz")
sha256sums=('06e657f71b9ac68af8756a8a0f48a4652f773ebc4f4a098ebc0a1677eba1c664')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/ledger2beancount "${pkgdir}/usr/bin/ledger2beancount"
  install -Dm755 bin/ledger2beancount-ledger-config "${pkgdir}/usr/bin/ledger2beancount-ledger-config"
  install -Dm644 ledger2beancount.yml "${pkgdir}/usr/share/doc/ledger2beancount/ledger2beancount.yml"
}
