# Maintainer: Matthias gatto <uso.cosmo.ray at gmail dot com>
# Reference: PKGBUILD(5)

pkgname=magicraminstaller-git
pkgver=r22.754049b
pkgrel=1
pkgdesc='Get ready for some painful insults...'

arch=('any')
url='https://github.com/kz6fittycent/magicraminstaller'

license=(BSD)

pkgver() {
  cd "${srcdir}/magicraminstaller"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

makedepends=('python-setuptools')
depends=()

source=("git://github.com/kz6fittycent/magicraminstaller")
sha256sums=("SKIP")


package() {
	mkdir -p "$pkgdir/usr/bin/"
        cp "${srcdir}/magicraminstaller/ram.py" "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin/ram.py"
}
