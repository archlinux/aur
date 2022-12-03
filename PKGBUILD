# Maintainer: xuhcc <xuhcc at cryptolab dot net>
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=ledger2beancount
pkgver=2.7
pkgrel=1
pkgdesc='Ledger to Beancount text-based converter'
arch=('any')
url="https://github.com/beancount/ledger2beancount"
license=('GPL')
depends=('perl' 'perl-date-calc'
         'perl-datetime-format-strptime' 'perl-file-basedir'
         'perl-getopt-long-descriptive' 'perl-string-interpolate' 'perl-yaml-libyaml'
         'perl-enum' 'perl-regexp-common' 'perl-list-moreutils'
         )
conflicts=('ledger2beancount-git')
source=("https://github.com/beancount/ledger2beancount/archive/${pkgver}.tar.gz")
sha256sums=('6c241c01f4fcc1be039583412b4dd45fc9d86cd14563c38d75bdfab72a1f4a28')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/ledger2beancount "${pkgdir}/usr/bin/ledger2beancount"
  install -Dm755 bin/ledger2beancount-ledger-config "${pkgdir}/usr/bin/ledger2beancount-ledger-config"
  install -Dm644 ledger2beancount.yaml "${pkgdir}/usr/share/doc/ledger2beancount/ledger2beancount.yaml"
}
