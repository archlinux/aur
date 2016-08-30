# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Ranieri Althoff <ranisalt+aur@gmail.com>

pkgname=heroku-toolbelt
pkgver=3.43.9
pkgrel=1
pkgdesc="Everything you need to get started using Heroku"
arch=('i686' 'x86_64')
url="https://toolbelt.heroku.com"
license=('MIT')
depends=('ruby')
optdepends=('git')
provides=('heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
conflicts=('heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client-${pkgver}.tgz")
sha256sums=('67b8c4424ab5bf637658a66baaa4c189c9caf170a70026789f0c8882f026941c')

package() {
  cd "${srcdir}"

  install -dm 755 "${pkgdir}/opt"
  install -dm 755 "${pkgdir}/usr/bin"

  mv heroku-client "${pkgdir}/opt/heroku-toolbelt"
  ln -s /opt/heroku-toolbelt/bin/heroku "${pkgdir}/usr/bin/heroku"
}
