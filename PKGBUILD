# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ananas-cli
pkgver=0.9.0
pkgrel=1
pkgdesc="A hackable data integration & analysis tool to enable non technical users to edit data processing jobs and visualise data on demand (CLI)"
arch=('any')
url='https://ananasanalytics.com'
license=('Apache')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}.zip::https://github.com/ananas-analytics/ananas-desktop/releases/download/v${pkgver}/Ananas.Analytics.Desktop.Edition-CLI-${pkgver}.zip")
sha256sums=('09debe5fc58c1ed61d8701ed1b1aa3b27f7408ffa5f74930ec6fa26a74a8a012')

package() {
  install -Dm644 cli/${pkgname}-${pkgver}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  echo "#!/usr/bin/env bash
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > ananas-cli.sh
  install -Dm755 ananas-cli.sh "${pkgdir}/usr/bin/ananas-cli"
}