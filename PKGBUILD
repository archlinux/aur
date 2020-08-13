# Maintainer: Denis Sheremet <me@lxlz.space>
pkgname=legendary-run-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r2.2cd5616
pkgrel=1
pkgdesc="bash script to check updates and launch a game using legendary"
arch=('any')
url="https://gitlab.com/lesf0/legendary-run"
license=('Apache')
groups=()
depends=('legendary' 'zenity')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://gitlab.com/lesf0/legendary-run.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -DT "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}