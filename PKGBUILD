# maintainer: libele <libele@disroot.org>

pkgname=vilearn
pkgver=1.0
pkgrel=7
pkgdesc="An interactive vi tutorial."
url="https://web.archive.org/web/20020806204039/http://vilearn.org/"
license=('custom')
arch=('any')

source=("https://archive.org/download/vilearn/vilearn"{-1.0.tar.gz,.diff})

md5sums=('8fd3b72e5eb1e4dce1870e7b3becbeab'
	 '39975f4064c59c30545f6f070fc85cc6')

package() {
  cd "${srcdir}"
  patch -d vilearn-1.0 < vilearn.diff

  cd vilearn-1.0
  make DESTDIR=${pkgdir} install
  install -Dm644 README "${pkgdir}"/usr/share/vilearn
}
