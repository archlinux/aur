# Maintainer: Jah Way <jahway603 at protonmail dot com>
pkgname=dnstop-git
_pkgname=dnstop
pkgver=20140915.2ec80df
pkgrel=1
pkgdesc="displays various tables of DNS traffic on your network"
arch=(i686 x86_64)
url="https://github.com/measurement-factory/dnstop"
license=('BSD')
depends=('libpcap')
conflicts=('dnstop')
provides=('dnstop')
source=("git+$url"
        "https://raw.githubusercontent.com/measurement-factory/dnstop/master/LICENSE")
sha256sums=('SKIP'
            'b4a15b9a1e44ce1ef569572820c9dc7ddda344d809a0d8376fc7955f54a1b896')

build() {
  cd $srcdir/$_pkgname
  ./configure
  make
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  # install manpage
  install -Dm644 $_pkgname.8 "$pkgdir/usr/share/man/man8/$_pkgname.8"
}
