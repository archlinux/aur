# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agent-bridge
_npmname=@raysonmeng/agentbridge
pkgver=0.1.31
pkgrel=1
pkgdesc="Local bridge for collaboration between Claude Code and Codex"
arch=('any')
url="https://github.com/raysonmeng/agent-bridge"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/agentbridge-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('dd9d1b05caa44ef1c2b1f4064b7b14b77d46555d0e839dec500755f932f7e6df')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
