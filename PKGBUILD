# Maintainer: Jesse Quinn <me@jessequinn.info>

pkgname=plexconnect-current
pkgver=0.6
pkgrel=1
pkgdesc="Integration layer between Apple TV and Plex"
arch=('x86_64')
url="https://github.com/iBaa/PlexConnect"
license=('MIT')
depends=('python2' 'openssl')

source=()
sha256sums_x86_64=('5f78f7f57edb8ae5b3c16147f8817f9b5e23c3fc7c3c2213477c91ddebd0c9a5')

source_x86_64=("https://github.com/iBaa/PlexConnect/archive/V${pkgver}.tar.gz")

package() {
	pkgpath="$pkgdir/opt/PlexConnect-$pkgver"
  
	cd ${srcdir}

  	mkdir -p "$pkgpath/"

	cp -r PlexConnect-${pkgver}/* "$pkgpath/"

  	install -Dm644 "$srcdir/PlexConnect-$pkgver/plexconnect.service" "$pkgdir/usr/lib/systemd/system/plexconnect.service"
}

