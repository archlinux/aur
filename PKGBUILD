# Maintainer: Stephen Martin <hwkiller at gmail dot com>
pkgname=rhythmbox-plugin-radio-browser-git
pkgver=3.0
pkgrel=2
pkgdesc="Rhythmbox plugin that shows the radio station lists of icecast and shoutcast directly in rhythmbox"
arch=(any)
url="http://www.radio-browser.info"
license=('GPL3')
depends=('rhythmbox' 'streamripper')
source=("$pkgname::git+https://github.com/fossfreedom/radio-browser.git#branch=rb3")

pkgver() {
	cd "$pkgname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir" install
}

md5sums=('SKIP')
