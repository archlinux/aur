# Maintainer: Nacho Barrientos <nacho@criptonita.com>
# Maintainer: pancho horrillo <pancho at pancho dot name>
_pkgname=oauth2ms
pkgname=${_pkgname}-git
pkgrel=1
pkgver=r10.a1ef0cabfdea
pkgdesc="XOAUTH2 compatible O365 token fetcher"
arch=('any')
url="https://github.com/harishkrupo/$_pkgname"
license=('Apache')
makedepends=('git')
depends=('python-pyxdg' 'python-msal' 'python-gnupg')
source=(git+$url.git)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=12 HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm755 oauth2ms "${pkgdir}/usr/bin/oauth2ms"
}
