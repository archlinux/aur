# Maintainer:  Konstantinos Tampouris <ktamp@chem.uoa.gr>
# Contributor: FJ <joostef@gmail.com>
# Contributor: Zaplanincan <zaplanincan@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>

pkgname=dosage-git
_pkgname=dosage
pkgver=1412
pkgrel=1
pkgdesc='A comic downloader and archiver.'
arch=('any')
url='http://dosage.rocks'
license=('GPL')
depends=('python' 'python-colorama' 'python-lxml' 'python-pbr' 'python-requests')
makedepends=('git')
source=("git+https://github.com/webcomics/$_pkgname.git"
	'dosage.1.gz')
md5sums=('SKIP'
	'3d1ba2b7d8464c3ec1fd0d77eba9f151')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}

package() {
  cd $srcdir/$_pkgname
  python setup.py install --root=$pkgdir/ --optimize=1
  install -D ../../dosage.1.gz $pkgdir/usr/share/man/man1/dosage.1.gz
}
