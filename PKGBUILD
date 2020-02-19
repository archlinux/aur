# Maintainer:  Konstantinos Tampouris <ktamp@chem.uoa.gr>
# Contributor: FJ <joostef@gmail.com>
# Contributor: Zaplanincan <zaplanincan@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>

_pkgname=dosage
pkgname=$_pkgname-git
pkgver=2.18.dev7+g5fa65741a
pkgrel=1
pkgdesc='A comic downloader and archiver.'
arch=('any')
url='https://dosage.rocks'
license=('MIT')
depends=('python' 'python-colorama' 'python-imagesize' 'python-lxml' 'python-requests')
makedepends=('git' 'python-wheel')
source=("git+https://github.com/webcomics/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  python setup.py --version
}

package() {
  cd $srcdir/$_pkgname
  python setup.py install --root=$pkgdir/ --optimize=1
  install -d $pkgdir/usr/share/doc/$_pkgname
  install CHANGELOG.md $pkgdir/usr/share/doc/$_pkgname
  install COPYING $pkgdir/usr/share/doc/$_pkgname
  install README.md $pkgdir/usr/share/doc/$_pkgname
  install doc/* $pkgdir/usr/share/doc/$_pkgname
}
