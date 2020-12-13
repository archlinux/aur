# Maintainer: Mario Finelli <mario at finel dot li>

_pkgname=ansible-gpg-key
pkgname=${_pkgname}-git
pkgver=r3.af34631
pkgrel=1
pkgdesc="Module to manage GPG keys from files and keyservers"
arch=(any)
url="https://github.com/netson/ansible-gpg-key"
license=(MIT)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(ansible)
makedepends=(git)
source=("git+https://github.com/netson/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  install -Dm0644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm0644 gpg_key.py \
    "$pkgdir/usr/share/ansible/plugins/modules/gpg_key.py"
}

# vim: set ts=2 sw=2 et:
