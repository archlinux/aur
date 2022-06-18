# maintainer: libele <libele@disroot.org>

# contributor: Michael Straube <michael_straube@web.de>
# contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=cadubi
pkgver=1.3.4
pkgrel=1
pkgdesc="Creative ASCII Drawing Utility By Ian"
arch=('any')
url="https://github.com/statico/cadubi"
license=('MIT')
depends=('perl-term-readkey')
source=("https://github.com/statico/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('0b259dbdf86d6ceb98a7ecd97dcf0496')

prepare() {
  cd $pkgname-$pkgver

  sed 's|$Bin/help.txt|/usr/share/cadubi/help.txt|g' -i cadubi
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/cadubi/cadubi "$pkgdir"/usr/bin/cadubi

  install -Dm755 cadubi "$pkgdir"/usr/share/cadubi/cadubi
  install -Dm644 help.txt "$pkgdir"/usr/share/cadubi/help.txt

  install -Dm644 cadubi.1 "$pkgdir"/usr/share/man/man1/cadubi.1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
