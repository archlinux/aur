# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=ledger2beancount
pkgver=2.5
pkgrel=1
pkgdesc='Ledger to Beancount text-based converter'
arch=('any')
url="https://github.com/beancount/ledger2beancount"
license=('GPL')
depends=('perl' 'perl-config-onion' 'perl-date-calc'
         'perl-datetime-format-strptime' 'perl-file-basedir'
         'perl-getopt-long-descriptive' 'perl-string-interpolate' 'perl-yaml-libyaml'
         'perl-enum' 'perl-regexp-common' 'perl-list-moreutils'
         )
conflicts=('ledger2beancount-git')
source=("https://github.com/beancount/ledger2beancount/archive/${pkgver}.tar.gz")
sha256sums=('ea0236306801236e40b7d4e0cf30af9af8d374b301a5493de7de17d54315fe15')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/ledger2beancount "${pkgdir}/usr/bin/ledger2beancount"
  install -Dm755 bin/ledger2beancount-ledger-config "${pkgdir}/usr/bin/ledger2beancount-ledger-config"
  install -Dm644 ledger2beancount.yaml "${pkgdir}/usr/share/doc/ledger2beancount/ledger2beancount.yaml"
}
