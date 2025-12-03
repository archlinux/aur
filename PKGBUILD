# Originally from: https://archlinux.org/packages/gemini-cli/ kept auto update nightly
opkg=gemini-cli
pkgname=$opkg-autoup
pkgver=0.19.1
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal. Nightly auto-update version."
arch=('x86_64')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@google/$opkg/-/$opkg-$pkgver.tgz")
sha256sums=('360f3d182b7aa43994c7712f4480add683644239cdbcdba0054ec987ed789778')
conflicts=("$opkg")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${opkg}-${pkgver}.tgz"
}
