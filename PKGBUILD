# Maintainer: Dotz0cat <Dotz0cat@gmail.com>
pkgname=webscreensaver-git
pkgver=r73.507c984
pkgrel=1
pkgdesc="Use any web page as your screensaver"
arch=('any')
url="https://github.com/lmartinking/webscreensaver"
license=('GPL2')
provides=('webscreensaver')
conflicts=('webscreensaver')
depends=('webkit2gtk' 'gtk3' 'python')
optdepends=('xscreensaver: run with xscreensaver'
	    'xfce4-screensaver: run under xfce4')
makedepends=('git')
source=("${pkgname}::git+https://github.com/lmartinking/webscreensaver.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm755 webscreensaver "${pkgdir}/usr/lib/xscreensaver/webscreensaver"
  install -Dm755 webscreensaver.desktop "${pkgdir}/usr/share/applications/screensavers/webscreensaver.desktop"
}

