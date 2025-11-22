# Originally from: https://archlinux.org/packages/gemini-cli/ kept auto update nightly
opkg=gemini-cli
pkgname=$opkg-autoup
pkgver=0.17.1
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal. Nightly auto-update version."
arch=('x86_64')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@google/$opkg/-/$opkg-$pkgver.tgz")
sha256sums=('6e506cba746f3f24ef9ed0d8847e07003f34852de759af1923191e0d2bc2d95b')
conflicts=("$opkg")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${opkg}-${pkgver}.tgz"
}
