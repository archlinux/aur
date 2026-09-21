# Maintainer: Mac Mansfield-Parisi <maclean dot mansfield dot parisi at gmail dot com>
pkgname=pelicanplatform-bin
pkgver=7.26.2
pkgrel=1
pkgdesc="The command line clients for the Pelican Platform data federation system"
arch=('x86_64')
url="https://github.com/PelicanPlatform/pelican"
license=('Apache-2.0')

# different Pelican versions use the same name tarball - screws up srcdir
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PelicanPlatform/pelican/releases/download/v${pkgver}/pelican_Linux_x86_64.tar.gz")
sha256sums=("4cb66bdbcc5965e7aa95c233e095aa501fb7038cb9d123d961b5a51619206b90")

# binary is named the same as unrelated utility. sigh.
conflicts=("pelican")

package() {
	# install the client binary
	install -Dm755 "pelican-$pkgver/pelican" "$pkgdir/usr/bin/pelican"
	# the server binary is no longer included - send me an email if you want/need
	# that packaged on here.

	# see README at https://github.com/PelicanPlatform/pelican/blob/main/README.md
	# for usage guide
}
