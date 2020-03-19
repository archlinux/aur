# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=feathers-cli
pkgver=4.3.0
pkgrel=1
pkgdesc="The command line interface for scaffolding Feathers applications"
arch=('any')
url='https://github.com/feathersjs/feathers'
license=('MIT')
depends=('perl')
makedepends=('npm')
noextract=("v${pkgver}.tar.gz")
source=("https://github.com/feathersjs/cli/archive/v${pkgver}.tar.gz")
md5sums=('af4983c3dc11eb8e561df922bb27e4df')

package() {
  cd "${srcdir}"
  mkdir ${srcdir}/npm-cache
  npm install --cache "${srcdir}/npm-cache" -g --user root --prefix "${pkgdir}/usr" "${srcdir}/v4.3.0.tar.gz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}