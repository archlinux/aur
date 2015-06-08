# Maintainer: Mirco Tischler <mt-ml at gmx dot de>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

pkgname="efitools"
pkgver=1.5.3
pkgrel=1
pkgdesc="Tools for manipulating UEFI secure boot platforms"
url="https://build.opensuse.org/package/show/home:jejb1:UEFI/efitools"
arch=('x86_64')
license=('GPL2' 'LGPL2.1')
makedepends=('gnu-efi-libs' 'help2man' 'perl-file-slurp' 'sbsigntools')
depends=('openssl')
optdepends=('mactel-boot: For bless command in Apple Mac systems')
install="${pkgname}.install"
source=("https://build.opensuse.org/source/home:jejb1:UEFI/efitools/${pkgname}-${pkgver}.tar.gz")
sha256sums=('96f7805a628d0fb9a7b6ba3cea7db782276fc48313e2ae528503b9ad9e209915')

build() {
	cd "${pkgname}-${pkgver}"

	make
}

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

