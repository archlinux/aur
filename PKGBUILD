# Maintainer : 00ein00 <Ein420@proton.me>

VUFIND_HOME=usr/local/vufind/
VUFIND_CONF_DIR=$VUFIND_HOME/config/vufind

DLAGENTS=("https::/usr/bin/wget -N --timestamping %u")

pkgname='vufind'
pkgver=11.0.0
pkgrel=1
pkgdesc='VuFind® is a discovery system designed and developed for libraries by libraries.'
arch=('any')
source=(
  'https://github.com/vufind-org/vufind/releases/download/v'$pkgver'/vufind_'$pkgver'.deb'
)

url='https://vufind.org/'

license=('GPL-2.0')
makedepends=('wget')
depends=('apache' 'java-runtime' 'java-environment' 'mariadb' 'php' 'php-pear' 'php-gd')
optdepends=('composer: update php packages')
provides=('vufind=${pkgver}')
conflicts=('vufind')

install=vufind.install

sha256sums=('64fe6c8acf063b7e2e59d15a494d48f9b211f5ad629ff399a100cb58c8f2e113')

package() {

  bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
  mkdir -p "${pkgdir}/usr/share/licenses/"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/vufind" "${pkgdir}/usr/local/vufind/LICENSE"
}
