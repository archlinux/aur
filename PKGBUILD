# Maintainer: Erik Bender <erik.bender@develerik.dev>

_pkgname=git-credential-1password
_orga=develerik
_gourl=github.com/$_orga/$_pkgname
_pkgver="1.2.0"

pkgname="${_pkgname}-bin"
pkgver="$_pkgver"
pkgrel=1
pkgdesc="Git credential.helper using 1Password for storage"
arch=('x86_64')
url="https://$_gourl"
license=('ISC')
depends=('git' '1password-cli')
provides=('git-credential-1password')
conflicts=("$_pkgname-dev-git" "$_pkgname" "$_pkgname-git")
source=("https://${_gourl}/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_linux_amd64.tar.gz")
sha256sums=('ca88357806212a553882e146f894085e9f86788a8705b60cb5da9ad84ba1bd93')

package() {
  cd ${srcdir}
  install -DT -m0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
