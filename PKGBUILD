# Maintainer: Mario Finelli <mario at finel dot li>

_pkgname=ansible-gsetting
pkgname=${_pkgname}-git
pkgver=r18.3f21f84
pkgrel=1
pkgdesc="Ansible module for setting GSettings entries"
arch=(any)
url=https://github.com/jistr/ansible-gsetting
license=(Apache)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(ansible)
makedepends=(git)
source=("git+https://github.com/jistr/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  install -Dm0644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -Dm0644 gsetting.py \
    "$pkgdir/usr/share/ansible/plugins/modules/gsetting.py"
}

# vim: set ts=2 sw=2 et:
