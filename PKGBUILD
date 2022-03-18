# Maintainer: Matthias gatto <uso.cosmo.ray at gmail dot com>
# Reference: PKGBUILD(5)

pkgname=magicraminstaller-git
pkgver=r28.849da5a
pkgrel=1
pkgdesc='A Magic RAM Installer'

arch=('any')
url='https://github.com/kz6fittycent/magicraminstaller'

license=(MIT)

pkgver() {
  cd "${srcdir}/magicraminstaller"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

makedepends=('git')
depends=('python')

source=("git+https://github.com/kz6fittycent/magicraminstaller")
sha256sums=("SKIP")


package() {
	install -Dm755 "${srcdir}/magicraminstaller/ram.py" "$pkgdir/usr/bin/ram.py"
	install -D "${srcdir}/magicraminstaller/LICENSE" "$pkgdir/usr/share/licenses/magicraminstaller/LICENSE"
}
