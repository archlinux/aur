# Maintainer: Winux <winuxlinux11@gmail.com>

pkgname=nature-wallpapers-git
pkgver=1.0
pkgrel=1
pkgdesc="A collection of nature wallpapers"
arch=(any)
url="https://gitlab.com/winux1/nature-wallpapers.git/"
license=('CCPL:by-nc-sa')
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf ""${pkgver%.r*}".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "${pkgdir}/usr/share/backgrounds/nature-wallpapers"
  install -m644 *.jpg "${pkgdir}/usr/share/backgrounds/nature-wallpapers/"
}