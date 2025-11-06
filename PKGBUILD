# Originally from: https://archlinux.org/packages/gemini-cli/ kept auto update nightly
opkg=gemini-cli
pkgname=$opkg-autoup
pkgver=0.12.0
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal. Nightly auto-update version."
arch=('x86_64')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@google/$opkg/-/$opkg-$pkgver.tgz")
sha256sums=('8eef4daf5bda399ac60fbd163a7e4a1a585fc226f675465e93d63efa1aba08cc')
conflicts=("$opkg")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${opkg}-${pkgver}.tgz"
}
