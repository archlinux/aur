# Maintainer: Joeran "chepaz" <mx-bounce at gmx dot de>
# Contributor: Michael "mbostwick" <mbostwick89 at gmail dot com>
# Contributor: Vasil Yonkov <bustervill at gmail dot com>

pkgname=deb2targz
pkgver=0.1
pkgrel=7
pkgdesc="convert a Debian Linux .deb file to a .tar.gz"
arch=('any')
url="http://www.miketaylor.org.uk/tech/deb/deb2targz"
license=('unknown')
depends=('perl')
source=('http://www.miketaylor.org.uk/tech/deb/deb2targz' 'http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-arch/deb2targz/files/deb2targz-any-data.patch')

sha256sums=('f597319db098a9d6b5199e39b8a9ced0973d9ee84927286de4d5816d8e76a44b'
            'f4a5404ee9f98bba948e83201832332494997b7e0b804c6f7572aa6f5c31a358')

build() {
	patch --follow-symlinks -i $srcdir/deb2targz-any-data.patch $srcdir/deb2targz
}

package() {
  install -Dm755 deb2targz  $pkgdir/usr/bin/deb2targz
}

# vim:set ts=2 sw=2 et:
