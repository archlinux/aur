# Maintainer: Levi Sabah <0xl3vi@gmail.com

pkgname=hostsctl-git
pkgver=r73.eb70e6a
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/0xl3vi/${pkgname%-git}"
license=('GPLv3')
depends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git://github.com/0xl3vi/${pkgname%-git}.git")
md5sums=('SKIP')
install=hostsctl.install

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 bin/hostsctl.sh "${pkgdir}/usr/bin/hostsctl"
  install -Dm644 etc/hostsctl.conf "${pkgdir}/usr/share/doc/${pkgname}/hostsctl.conf"
  mkdir -p "${pkgdir}/etc/hostsctl.d/"
  install -Dm644 LICENSE "${pkgdir%-git}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
