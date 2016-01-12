# Maintainer : Johnathan Jenkins <twodopeshaggy@gmail.com>
# Submitter (aur/keychain-git): Emil Lundberg <lundberg.emil@gmail.com> <keybase.io/emlun>
# Contributor (extra/keychain): Eric Bélanger <eric@archlinux.org>

_pkgname=keychain
pkgname="${_pkgname}-git"
pkgver=2.8.2.1.gc93da4b
pkgrel=1
pkgdesc="A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login"
arch=('any')
url="http://www.funtoo.org/Keychain"
license=('GPL2')
depends=('sh')
makedepends=('git')
conflicts=('keychain')
source=("git+https://github.com/funtoo/keychain#branch=master")
sha1sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --tags | tr - .
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  install -Dm755 keychain "${pkgdir}/usr/bin/keychain"
  install -Dm644 keychain.1 "${pkgdir}/usr/share/man/man1/keychain.1"
}
