# Maintainer:  Konstantinos Tampouris <ktamp@chem.uoa.gr>
# Contributor: FJ <joostef@gmail.com>
# Contributor: Zaplanincan <zaplanincan@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>

pkgname=dosage
pkgver=2.17
pkgrel=1
pkgdesc='A comic downloader and archiver.'
arch=('any')
url='https://dosage.rocks'
license=('MIT')
depends=('python' 'python-colorama' 'python-imagesize' 'python-lxml' 'python-requests' 'python-six')
makedepends=('git' 'python-wheel')
source=("git+https://github.com/webcomics/$pkgname.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd $srcdir/$pkgname
  python setup.py install --root=$pkgdir/ --optimize=1
  install -d $pkgdir/usr/share/doc/$pkgname
  install CHANGELOG.md $pkgdir/usr/share/doc/$pkgname
  install COPYING $pkgdir/usr/share/doc/$pkgname
  install README.md $pkgdir/usr/share/doc/$pkgname
  install doc/* $pkgdir/usr/share/doc/$pkgname
}
