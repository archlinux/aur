# Maintainer: widowild
# Contributors: Danny Su <contact@dannysu.com>

pkgname=keepass-plugin-http-git
pkgver=20170410
pkgrel=1
pkgdesc="KeePass plugin to expose password entries securely (256bit AES/CBC) over HTTP"
license=('GPL3')
depends=('keepass')
conflicts=('keepasshttp' 'keepass-plugin-http')
arch=('any')
url="http://github.com/pfn/keepasshttp"
source=(https://github.com/pfn/keepasshttp/raw/master/KeePassHttp.plgx)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  mkdir -p "${pkgdir}"/usr/share/keepass/plugins
  install -m644 KeePassHttp.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
