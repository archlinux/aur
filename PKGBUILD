# Maintainer: kugland <kugland at gmail dot com>

pkgname=rename.pl
pkgver=2.0.0
pkgrel=2
pkgdesc='Rename files using perl expressions'
arch=('any')
url='https://github.com/kugland/rename.pl'
license=('mit')
depends=('gcc-libs' 'perl>=5.3.0' 'perl-try-tiny')
optdepends=('perl-text-unidecode: unidecode support')
source=("https://github.com/kugland/rename.pl/archive/$pkgver.tar.gz")
sha256sums=('230b357e2012f29eb444181b0d9ca2a7cf01c0ba9779b68079b92824fd761780')

package() {
  DIR="rename.pl-$pkgver"
  tar -xzf "$pkgver.tar.gz"
  gzip -9 ${DIR}/rename.pl.1
  install -Dm755 ${DIR}/rename.pl ${pkgdir}/usr/bin/rename.pl
  install -Dm644 ${DIR}/rename.pl.1.gz ${pkgdir}/usr/share/man/man1/rename.pl.1.gz
  install -Dm644 ${DIR}/README.md ${pkgdir}/usr/share/doc/rename-pl/README.md
  install -Dm644 ${DIR}/LICENSE ${pkgdir}/usr/share/doc/rename-pl/LICENSE
}
