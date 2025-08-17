# Maintainer: Mohammad Rostami <mohammad.jayant@gmail.com>
pkgname=farsidic
pkgver=1.2
pkgdesc="A simple farsi dictionary"
url="https://github.com/mohammadrostamiorg/farsidic"
arch=('any')
license=('GPL-3')
maintainer="Mohammad Rosstami <mohammad.jayant@gmail.com>"
source=("script.sh" "dictionaries.tar.gz::https://github.com/MohammadRostamiorg/farsidic/releases/download/v1.1/dictionaries.tar.gz")
depends=('bash' 'coreutils' 'jq')
pkgrel=1
sha256sums=("SKIP" "SKIP")
package() {
  install -Dm755 script.sh "${pkgdir}/usr/bin/farsidic"
  install -Dm644 dictionaries.tar.gz "${pkgdir}/etc/farsidic/dictionaries.tar.gz"
  tar -xzf dictionaries.tar.gz -C "${pkgdir}/etc/farsidic/"
  rm -rf "${pkgdir}/etc/farsidic/dictionaries.tar.gz"
}
