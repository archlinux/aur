# Maintainer: Mirco Tischler <mt-ml at gmx dot de>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

pkgname="efitools"
pkgver=1.7.0
pkgrel=1
pkgdesc="Tools for manipulating UEFI secure boot platforms"
url="https://build.opensuse.org/package/show/home:jejb1:UEFI/efitools"
arch=('x86_64')
license=('GPL2' 'LGPL2.1')
makedepends=('gnu-efi-libs' 'help2man' 'perl-file-slurp' 'sbsigntools' 'git')
depends=('openssl')
optdepends=('mactel-boot: For bless command in Apple Mac systems')
install="${pkgname}.install"
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/jejb/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"

	make
}

package() {
	cd "${pkgname}"

	make DESTDIR="${pkgdir}" install
}

