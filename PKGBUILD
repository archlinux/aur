# Maintainer: Erik Bender <erik.bender@develerik.dev>

_pkgname=git-credential-1password
_orga=develerik
_gourl=github.com/$_orga/$_pkgname
_pkgver="1.1.0"

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
sha256sums=('2427b9597c5499bd762250f79177570124f2797de583f2b7d64f3be1e06bead1')

package() {
  cd ${srcdir}
  install -DT -m0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
