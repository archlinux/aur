# Maintainer: xnomad <xnomadbb@gmail.com>
# Maintainer: SolarAquarion <shlomochoina@gmail.com>
pkgname=pythonbits-git
pkgver=r139.d8c332b
pkgrel=1
pkgdesc="The Python Baconbits description generator"
arch=('any')
url="https://github.com/Ichabond/Pythonbits"
license=('BSD')
depends=('python2' 'ffmpeg' 'mediainfo' 'python2-beautifulsoup4' 'python2-wsgiref' 'python2-requests' 'python2-imdbpie' 'tvdb_api')
makedepends=('git')
source=(pythonbits::git+git://github.com/hiphiphiphip/Pythonbits.git)

pkgver(){
  cd pythonbits
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "pythonbits/bin"
	sed -i -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|' pythonbits
}

package() {
	cd "pythonbits"
    mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
	cp -Rr pythonbits/ "${pkgdir}"/usr/lib/python2.7/site-packages/


	install -D -m755 bin/pythonbits "${pkgdir}"/usr/bin/pythonbits
}

md5sums=('SKIP')
