# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >
# Maintainer: restitux <restitux at ohea dot xyz>

_pkgnameMeta="edk2-ovmf-fedora"
_fedoraVersion=42
_rpmRelease=16

pkgname=${_pkgnameMeta}-bin
pkgver=20250523
pkgrel=2
pkgdesc="UEFI firmware for x86_64 virtual machines from Fedora ${_fedoraVersion} — pre-configured with Secure Boot"
arch=('any')
url='https://packages.fedoraproject.org/pkgs/edk2/edk2-ovmf/'
license=('BSD')
install="${_pkgnameMeta}.install"
# 
# For links, consider looking through mirrors here, as there are tons of them:
# - https://mirrormanager.fedoraproject.org/
# - https://fedoraproject.org/wiki/Infrastructure/Mirroring
# 
# Just pick any from those mirrors; they all share the same structure
# 
# source=("https://download.fedoraproject.org/pub/fedora/linux/releases/${_fedoraVersion}/Everything/x86_64/os/Packages/e/edk2-ovmf-${pkgver}-${_rpmRelease}.fc${_fedoraVersion}.noarch.rpm")
source=("https://kojipkgs.fedoraproject.org/packages/edk2/${pkgver}/${_rpmRelease}.fc${_fedoraVersion}/noarch/edk2-ovmf-${pkgver}-${_rpmRelease}.fc${_fedoraVersion}.noarch.rpm")
sha256sums=('ac376298edc126b6fcfac4736d537480b2c132ceec26b9c811bd8edd61ca0460')

package() {
	# Copy documentation + licenses
	mkdir -p "$pkgdir/usr/share/doc" "$pkgdir/usr/share/licenses"
	cp -r usr/share/doc/edk2-ovmf "$pkgdir/usr/share/doc/${_pkgnameMeta}/"
	cp -r usr/share/licenses/edk2-ovmf "$pkgdir/usr/share/licenses/${_pkgnameMeta}/"

	# Copy everything else
	mkdir -p "$pkgdir/usr/share/${_pkgnameMeta}"
	cp -r usr/share/qemu "$pkgdir/usr/share/${_pkgnameMeta}/"
	cp -r usr/share/edk2 "$pkgdir/usr/share/${_pkgnameMeta}/"
	cp -r usr/share/OVMF "$pkgdir/usr/share/${_pkgnameMeta}/"
}