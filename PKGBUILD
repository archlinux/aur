# shellcheck shell=bash disable=SC2034,SC2154
_repo=msys2/MSYS2-packages
_pkgname=makepkg-mingw

pkgname=${_pkgname//_/-}
pkgver=6.0.1
pkgrel=1
pkgdesc="makepkg-mingw"
arch=(any)
url=https://github.com/$_repo
license=(GPL)
source=(
	makepkg-mingw
	makepkg_mingw.conf
)
sha256sums=(
	98198e1f0f252eae0560d271bee4b9149e127399dd0d3fd5d8d24579d9e0550f
	8cb6b244d39107afc6cff74d919708ffc58b903c42f82d050d1d49bbf31208ab
)

package() {
	install -Dm755 ../"$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 ../"${_pkgname//-/_}.conf" -t "$pkgdir/etc"
}
