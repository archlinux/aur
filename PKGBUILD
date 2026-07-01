# Maintainer: Mac Mansfield-Parisi <maclean dot mansfield dot parisi at gmail dot com>
pkgname=pelicanplatform-bin
pkgver=7.25.0
pkgrel=1
pkgdesc="The command line client for the Pelican Platform data federation system"
arch=('x86_64')
url="https://github.com/PelicanPlatform/pelican"
license=('Apache-2.0')

# different Pelican versions use the same name tarball - screws up srcdir
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PelicanPlatform/pelican/releases/download/v${pkgver}/pelican_Linux_x86_64.tar.gz")
sha256sums=("30d1cdbb5d18ff7dbb80e21f805666601d81a14579c5f10d6a153f80b818122a")

# binary is named the same as unrelated utility. sigh.
conflicts=("pelican")

package() {
	install -Dm755 "pelican-$pkgver/pelican" "$pkgdir/usr/bin/pelican"

	# see README at https://github.com/PelicanPlatform/pelican/blob/main/README.md
	# for usage guide
}
