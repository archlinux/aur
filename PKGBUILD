# Maintainer:Martin C. Doege <mdoege at compuserve dot com>

pkgname=grailbrowser
pkgver=20130618.d0a1049
pkgrel=2
pkgdesc="A late-1990s web browser in pure Python"
arch=('any')
url="https://github.com/mdoege/grailbrowser"
license=('CNRI')
depends=('python2' 'tk' 'libjpeg' 'netpbm')
makedepends=('git')
optdepends=('python2-imaging: additional image loading support'
            'inetutils: telnet binary for telnet URLs'
            'xterm: for telnet URLs')
source=("git://github.com/mdoege/grailbrowser.git")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
	cd ${srcdir}/${pkgname}
	mkdir -p $pkgdir/usr/share/grail
	cp -r * $pkgdir/usr/share/grail
	mkdir -p $pkgdir/usr/share/icons
	cp grail_logo.png $pkgdir/usr/share/icons
	mkdir -p $pkgdir/usr/share/applications
	cp grail.desktop $pkgdir/usr/share/applications
}
