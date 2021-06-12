# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=woman-git
pkgver=r49.216618c
pkgrel=1
pkgdesc='man-pages like cli utility for based.cooking'
arch=('any')
url='https://github.com/DavidRV00/woman'
license=('MIT')
depends=('pandoc')
makedepends=("git")
source=("$pkgname"::'git+https://github.com/DavidRV00/woman.git')
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/woman-git"
  install -Dvm755 woman "$pkgdir/usr/bin/woman"
  install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dvm644 completion/zsh/_woman "$pkgdir/usr/share/zsh/site-functions/_woman"
  install -Dvm644 completion/bash/woman "$pkgdir/usr/share/bash-completion/completions/woman"
}

# vim:set sw=2 et:
