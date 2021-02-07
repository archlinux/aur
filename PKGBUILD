# Maintaoner: Yamada Hayao <development@fascode.net>

reponame="lightdm-config"
pkgname="${reponame}-git"
pkgver=r15.cb28c6d
pkgrel=1
pkgdesc="A simple tool for editing LightDM"
arch=('any')
url="https://github.com/FascodeNet/lightdm-config"
license=('SUSHI-WARE')
depends=('lightdm' )
makedepends=('git')
source=("git+https://github.com/FascodeNet/lightdm-config.git")
md5sums=('SKIP')

pkgver() {
  cd "${reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -m 755 -D "${srcdir}/lightdm-config/lightdm-config" "${pkgdir}/usr/bin/lightdm-config"
    install -m 755 -D "${srcdir}/lightdm-config/LICENSE.md" "${pkgdir}/usr/share/licenses/lightdm-config/LICENSE.md"
}
