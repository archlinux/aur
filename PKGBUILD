# Maintainer: Justin Dray <justin@dray.be>

pkgname=dmakepkg-git
pkgver=r21.42ee55d
pkgrel=1
pkgdesc='Makepkg running from within docker for clean builds without maintaining a chroot'
arch=('any')
url="https://github.com/justin8/docker-makepkg"
license=('MIT')
depends=('docker')
options=(!emptydirs)
install='dmakepkg.install'
source=(git+https://github.com/justin8/docker-makepkg.git)
md5sums=('SKIP')

pkgver() {
	cd docker-makepkg
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${srcdir}/docker-makepkg/dmakepkg" "${pkgdir}/usr/bin/dmakepkg"
}
