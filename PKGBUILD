# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

_pkgname=ngrok
pkgname=ngrok
pkgver=1.7
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('Apache')
source=("git+https://github.com/inconshreveable/ngrok.git#tag=${pkgver}")
sha256sums=('SKIP')
arch=('i686' 'x86_64')
makedepends=('git' 'go' 'mercurial')

build() {
  cd "${srcdir}/${_pkgname}"

  # Build it!
  make -j1 release-all
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  install -Dm755 bin/ngrok  "${pkgdir}/usr/bin/ngrok"
  install -Dm755 bin/ngrokd "${pkgdir}/usr/bin/ngrokd"
}

# vim: ft=sh ts=2 sw=2 et
