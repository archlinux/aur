# maintainer: libele <libele@disroot.org>

pkgname=vilearn
pkgver=1.0.1
pkgrel=1
pkgdesc="An interactive vi tutorial."
arch=('any')
url="https://web.archive.org/web/20020806204039/http://vilearn.org/"
license=('custom:Copyright (c) 1992 Jill Kliger and Wesley Craig')
optdepends=('vi: the original ex/vi text editor')

source=('https://archive.org/download/vilearn/vilearn-1.0.tar.gz'
	"https://tildegit.org/libele/vilearn/archive/vilearn-$pkgver.tar.gz")

md5sums=('8fd3b72e5eb1e4dce1870e7b3becbeab'
	 'fdfba9fde37af73cbde0f83724cd3713')

package() {
  cd "${srcdir}"
  patch -d vilearn-1.0 < vilearn/vilearn-1.0.1.patch

  cd vilearn-1.0
  make DESTDIR=${pkgdir} install
  install -Dm644 README "${pkgdir}"/usr/share/vilearn
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/vilearn/LICENSE
}
