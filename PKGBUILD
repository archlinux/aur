# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=nemo-deja-dup-git
pkgver=r2.f99427f
pkgrel=5
pkgdesc="Déjà Dup Actions for Nemo File Manager"
arch=('any')
url="https://github.com/erickj/nemo-actions"
license=('unknown')
depends=('nemo' 'deja-dup')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/erickj/nemo-actions.git")
sha256sums=('SKIP')

pkgver() {
  cd nemo-actions
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd nemo-actions
  install -Dm644 *.nemo_action -t "$pkgdir/usr/share/nemo/actions/"
}
