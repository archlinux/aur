# Maintainer: Xynrin <xynrin@163.com>

pkgname=spark-store-tui
pkgver=0.7.2
pkgrel=1
pkgdesc='Terminal UI for browsing Spark Store and APM Store'
arch=('any')
url='https://github.com/Xynrin/spark-store-tui'
license=('GPL-3.0-only')
depends=('bash' 'curl' 'jq' 'fzf' 'aria2' 'ca-certificates')
optdepends=(
  'chafa: terminal image previews'
  'sudo: install downloaded packages with ssinstall or apm'
)
source=("https://github.com/Xynrin/${pkgname}/releases/download/v${pkgver}/${pkgname}-deb-source-${pkgver}.tar.gz")
sha256sums=('d1c3417896a2cd500326680b65f6c9ccee917207d59412c5a45dc95ddb7e864c')

package() {
  cd "${pkgname}-deb-source-${pkgver}"

  install -Dm755 "package-root/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

