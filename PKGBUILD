# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tweakcc
_npmname=tweakcc
pkgver=4.4.0
pkgrel=1
pkgdesc="Customize Claude Code system prompts, toolsets, themes and input behaviour"
arch=('x86_64' 'aarch64')
url="https://github.com/Piebald-AI/tweakcc"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/tweakcc-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('125b94a0c97743f3374071c78a3fc22829c5ee9497a7740a5f652ba7629d8d9d')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
