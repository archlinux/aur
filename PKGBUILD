# Maintainer: dwayne
pkgname=checkboot-efi
pkgver=0.1
pkgrel=1
pkgdesc="Verify efi files on boot"
arch=('any')
license=('GPL')
depends=('bash')
makedepends=()
url="https://github.com/dwayne80/checkboot-efi"
checkdepends=()
optdepends=()
provides=('checkboot-efi')
backup=('etc/checkboot-efi.conf')
install=$pkgname.install
source=("$pkgname.install"
	"checkboot-efi.hook"
	"checkboot-efi.install-hook"
	"checkboot-efi.conf")
sha512sums=('5f27cf4a271382c1da5cfd50ad5a8abe0818b990c7c0ff899a09ee751d55f28c5d028a0b1a7fb54e022e3ba5bc61a5b46ad87a27e510764fabc4ad8a5f9e67ca'
	    'f50eec33926fb0661fb51ec3b6d96fb2a83251ebb9cc1220d45c64d9114a97fcd693ac04f203b191d208a04767275c656f20c1c34d0fca3aacbf629eea2242c4'
            'd55428b009b733a2ff40f0d85dab404812cd50ab2a9471337398c2780da5669ba52878ed9b2de50d0134b4f014e4dbc0e75ce2aa28dda9560ca0d1375c94fc91'
	    '9df6b4906d32b635c789bb2e0665351977be510d5605889d6ec59ec04ba6abf407a3f762f9bf9ee215185a08cfc1478aa9918802010a505b43e424c23bbd8979')

package() {
  install -Dm644 "$srcdir/checkboot-efi.conf"			"$pkgdir/etc/checkboot-efi.conf"
  install -Dm644 "$srcdir/checkboot-efi.hook"			"$pkgdir/usr/lib/initcpio/hooks/checkboot-efi"
  install -Dm644 "$srcdir/checkboot-efi.install-hook"		"$pkgdir/usr/lib/initcpio/install/checkboot-efi"
}
