# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Ranieri Althoff <ranisalt+aur@gmail.com>

pkgname=heroku-toolbelt
pkgver=3.43.5
pkgrel=2
pkgdesc="Everything you need to get started using Heroku"
arch=('i686' 'x86_64')
url="https://toolbelt.heroku.com"
license=('MIT')
depends=('ruby')
optdepends=('git')
provides=('heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
conflicts=('heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client-${pkgver}.tgz")
sha256sums=('b71cbb64770cde487d76b6311e50582f08984ff5689aa024ba02d7fd81d0c1c0')

package() {
  cd "${srcdir}"

  install -dm 755 "${pkgdir}/opt"
  install -dm 755 "${pkgdir}/usr/bin"

  mv heroku-client "${pkgdir}/opt/heroku-toolbelt"
  ln -s /opt/heroku-toolbelt/bin/heroku "${pkgdir}/usr/bin/heroku"
}
