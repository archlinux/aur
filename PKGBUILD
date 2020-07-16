# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=r-analyticflow
pkgver=3.1.8
pkgrel=1
pkgdesc='A data analysis software that utilizes the R environment for statistical computing'
arch=('any')
url="http://r.analyticflow.com"
license=("custom:${pkgname}")
install=r-analyticflow.install
depends=('jdk8-openjdk' 'java8-openjfx' 'r-rjava')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::http://download.ef-prime.com/ranalyticflow/${pkgver}/bin/RAnalyticFlow_Linux_${pkgver}.tar.gz")
sha256sums=('fb14e330c2927f0b0de42196bdeb31f3e61222b37ab8ad357cca6096a6b0f395')

package() {
  install -d "${pkgdir}/opt" 
  install -Dm644 RAnalyticFlow_3/img/desktop_48.png "${pkgdir}/usr/share/pixmaps/r-analyticflow.png"
  install -Dm644 RAnalyticFlow_3/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 RAnalyticFlow_3/license_ja.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_JA"
  install -Dm644 RAnalyticFlow_3/linux/r-analyticflow.desktop -t "${pkgdir}/usr/share/applications/"
  rm -rf RAnalyticFlow_3/linux RAnalyticFlow_3/license.txt RAnalyticFlow_3/license_ja.txt
  cp -avR RAnalyticFlow_3 "${pkgdir}/opt/r-analyticflow"
}
# vim:set ts=2 sw=2 et: