# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=gnome-encfs-manager-bzr
pkgver=1.8.14+r550
pkgrel=1
pkgdesc="An easy to use manager and mounter for Encfs stashes."
url="https://launchpad.net/gencfsm"
arch=('any')
license=('GPL v2')
depends=('encfs' 'vala' 'intltool' 'libgee06' 'gtk3' 'libsm' 'libgnome-keyring')
makedepends=('bzr' 'vala' 'intltool')
conflicts=('gnome-encfs-manager')
provides=('gnome-encfs-manager')
install="$pkgname.install"
source=("$pkgname"::'bzr+https://code.launchpad.net/~gencfsm/gencfsm/trunk')
md5sums=('SKIP')

pkgver() {

    	cd $pkgname
    	
	# bzr revno
    	printf "1.8.14+r%s" "$(bzr revno)"
    
}

build() {

    	cd "$srcdir/$pkgname"

    	msg2 "  -> Build program ..."
  	./autogen.sh
  	./configure --prefix=/usr --disable-appindicator
  	make
  
}

package() {

    	cd "$srcdir/$pkgname"

    	msg2 "  -> Installing program, icons and .desktop file ..."
    	make DESTDIR="$pkgdir" install
    
}

# vim: ts=2 sw=2 et: