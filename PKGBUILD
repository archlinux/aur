# Maintainer: Alessandro Cerruti
# Contributor: Alessandro Cerruti

_pkgbase=i3bard
pkgname=i3bard-git
pkgver=r16.1b9dfb4
pkgrel=2
pkgdesc='async i3blocks clone that can synchronize multiple instances'
arch=('any')
url='https://gitlab.com/chrooti/i3bard'
license=('MIT')
depends=(python)
makedepends=(git)
source=('i3bard::git+https://gitlab.com/chrooti/i3bard.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgbase"

  install -Dm755 i3bard "$pkgdir"/usr/bin/i3bard
  install -Dm644 i3bard.service "$pkgdir"/usr/lib/systemd/user/i3bard.service
}
