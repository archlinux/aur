# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >

_fedoraVersion=42
_pkgnameMeta="edk2-ovmf-fedora"
_rpmRelease=8

pkgname=${_pkgnameMeta}-bin
pkgver=20250221
pkgrel=1
pkgdesc="UEFI firmware for x86_64 virtual machines from Fedora ${_fedoraVersion} — pre-configured with Secure Boot"
arch=('any')
url='https://packages.fedoraproject.org/pkgs/edk2/edk2-ovmf/'
license=('BSD')
# For links, consider looking through mirrors here, as there are tons of them:
# - https://mirrormanager.fedoraproject.org/
# - https://fedoraproject.org/wiki/Infrastructure/Mirroring
# Just pick any from those mirrors; they all share the same structure
source=("https://download.fedoraproject.org/pub/fedora/linux/releases/${_fedoraVersion}/Everything/x86_64/os/Packages/e/edk2-ovmf-${pkgver}-${_rpmRelease}.fc${_fedoraVersion}.noarch.rpm")
sha256sums=('1a5cbbb681e709e957dfce4e71d62227893adbc34a6918f1f1ed4c842710cb1c')


package() {
	# Copy licenses
	mkdir -p "$pkgdir/usr/share/licenses"
	cp -r usr/share/licenses/edk2-ovmf "$pkgdir/usr/share/licenses/${_pkgnameMeta}/"

	# Copy documentation
	mkdir -p "$pkgdir/usr/share/doc"
	cp -r usr/share/doc/edk2-ovmf "$pkgdir/usr/share/doc/${_pkgnameMeta}/"

	# Copy everything else
	mkdir -p "$pkgdir/usr/share/${_pkgnameMeta}"
	cp -r usr/share/qemu "$pkgdir/usr/share/${_pkgnameMeta}/"
	cp -r usr/share/edk2 "$pkgdir/usr/share/${_pkgnameMeta}/"
	cp -r usr/share/OVMF "$pkgdir/usr/share/${_pkgnameMeta}/"
}
