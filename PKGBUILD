# -*- shell-script -*-
# Contributor: Alastair Pharo  asppsa at gmail dot com
# Maintainer: Alastair Pharo  asppsa at gmail dot com

pkgname=nix-multiuser
pkgver=17.03 # indicates the version of NixOS used for the sandbox
pkgrel=3
pkgdesc="Set up multi-user environment for the Nix package manager"
arch=("any")
license=('MIT')
url="http://nixos.org/nix/manual/#ssec-multi-user"
depends=('nix>=1.10')
install=nix-multiuser.install
source=(nix-multiuser.sh
	nix.conf)
sha256sums=(fd7944625d3e334d45459ef249abda1ce04064d68b0a93160d5dc51d806e840b
	00786a1c819bd4779f0a93a18d3f35fbd122bc060c821512fe041d359286a507)
backup=(etc/nix/nix.conf)

package() {
  mkdir -p $pkgdir/etc/profile.d
  install -m 644 nix-multiuser.sh $pkgdir/etc/profile.d/

  mkdir -p $pkgdir/etc/nix
  install -m 644 nix.conf $pkgdir/etc/nix/
}
