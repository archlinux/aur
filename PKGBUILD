# Maintaoner: Yamada Hayao <development@fascode.net>

reponame="dmc"
pkgname="${reponame}-git"
pkgver=r45.2fc4960
pkgrel=1
pkgdesc="An all-in-one tool for configuring major display managers"
arch=('any')
url="https://github.com/FascodeNet/dmc"
license=('SUSHI-WARE')
depends=('bash' "vi" "util-linux" "crudini")
makedepends=('git')
source=("git+https://github.com/FascodeNet/dmc.git")
md5sums=('SKIP')

pkgver() {
  cd "${reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -m 755 -D "${srcdir}/dmc/dmc" "${pkgdir}/usr/bin/dmc"
    install -m 755 -D "${srcdir}/dmc/LICENSE.md" "${pkgdir}/usr/share/licenses/dmc/LICENSE.md"
}
