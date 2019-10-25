# Maintainer: ObserverOfTime <chronobserver@disroot.org>

_pkgname=yarn-completion
pkgname=yarn-completion-git
pkgver=v0.15.0.r3.gcbcb7b5
pkgrel=1
pkgdesc='Bash completion for Yarn'
url='https://github.com/dsifford/yarn-completion'
arch=('any')
license=('MIT')
depends=('bash' 'bash-completion' 'yarn')
makedepends=('git')
source=('git+https://github.com/dsifford/yarn-completion.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/$_pkgname"
  bash tests/test
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 $_pkgname.bash $pkgdir/etc/bash_completion.d/$_pkgname.bash
}

# vim:set ts=2 sw=2 et:
