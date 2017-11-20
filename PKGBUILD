# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Luca Contini <jkd[dot]luca[at]gmail[dot]com>

pkgname=asbru-cm-git
_pkgname=${pkgname%-git}
pkgver=5.0.0_RC4
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="A free and open-source connection manager. GIT version"
url="https://github.com/asbru-cm/asbru-cm"
depends=('perl-gnome2-gconf' 'glade-perl' 'openssh' 'perl-crypt-blowfish' 'perl-gnome2-vte' 'perl-expect' 'perl-crypt-rijndael' 'perl-gtk2-ex-simple-list' 'perl-io-stty' 'perl-io-tty' 'perl-net-arp' 'perl-yaml' 'perl-crypt-cbc' 'perl-gtk2-unique' 'perl-socket6' 'uuid')
makedepends=('git')
#conflicts=()
source=("git+https://github.com/asbru-cm/asbru-cm.git")
sha256sums=('SKIP')

package() {
	cd ${srcdir}/${_pkgname}
	mkdir -p $pkgdir/{opt/asbru,usr/share/pixmaps,usr/share/man/man1,usr/share/applications,usr/bin,etc/bash_completion.d}
	cp -rp res utils lib $pkgdir/opt/asbru/
	cp -p res/pac_bash_completion $pkgdir/etc/bash_completion.d/asbru_bash_completion
	cp res/asbru-logo-64.png $pkgdir/usr/share/pixmaps/asbru.png
	ln -sf /opt/asbru/asbru $pkgdir/usr/bin/asbru
	cp res/asbru.desktop $pkgdir/usr/share/applications/
	gzip -c res/pac.1 > $pkgdir/usr/share/man/man1/asbru.1.gz
	cp -p asbru $pkgdir/opt/asbru/asbru
	chmod 755 $pkgdir/opt/asbru/asbru
}


