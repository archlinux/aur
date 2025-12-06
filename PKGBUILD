# Originally from: https://archlinux.org/packages/gemini-cli/ kept auto update nightly
opkg=gemini-cli
pkgname=$opkg-autoup
pkgver=0.19.4
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal. Nightly auto-update version."
arch=('x86_64')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@google/$opkg/-/$opkg-$pkgver.tgz")
sha256sums=('2ae7ab76decd7133d2fd72993860e5860c4fcbe3b570855de73db11cb417b4b5')
conflicts=("$opkg")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${opkg}-${pkgver}.tgz"
}
