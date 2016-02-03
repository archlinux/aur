# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Ranieri Althoff <ranisalt+aur@gmail.com>

pkgname=heroku-toolbelt
pkgver=3.42.25
pkgrel=1
pkgdesc="Everything you need to get started using Heroku"
arch=('i686' 'x86_64')
url="https://toolbelt.heroku.com"
license=('MIT')
optdepends=('git')
conflicts=('heroku-client-standalone' 'heroku-toolbelt')
source=("https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client-${pkgver}.tgz")
sha256sums=('0394fa11def849d3279969ab503eb6c32f0d81b11735376358d26ba1766ddb56')

package() {
  cd "${srcdir}"

  install -dm 755 "${pkgdir}/opt"
  install -dm 755 "${pkgdir}/usr/bin"

  mv heroku-client "${pkgdir}/opt/heroku-toolbelt"
  ln -s /usr/local/heroku/bin/heroku "${pkgdir}/usr/bin/heroku"
}
