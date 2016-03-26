# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Ranieri Althoff <ranisalt+aur@gmail.com>

pkgname=heroku-toolbelt
pkgver=3.42.29
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
sha256sums=('1c174580a895ec4b446ab2d4837d00e731362dd4ee46268251e2cc7d99d077d9')

package() {
  cd "${srcdir}"

  install -dm 755 "${pkgdir}/opt"
  install -dm 755 "${pkgdir}/usr/bin"

  mv heroku-client "${pkgdir}/opt/heroku-toolbelt"
  ln -s /opt/heroku-toolbelt/bin/heroku "${pkgdir}/usr/bin/heroku"
}
