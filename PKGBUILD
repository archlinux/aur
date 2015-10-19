# Maintainer: Adrien Sohier <adrien.sohier@art-software.fr

pkgname=docker-openrc
pkgver=1.4.1.6992.geaa1fc4
pkgrel=1
arch=('any')
url="https://github.com/docker/docker"
license=('APACHE')
groups=('openrc-misc')
source=(git+git://github.com/docker/docker)
md5sums=('SKIP')
depends=('openrc-core')
makedepends=('git')

pkgver() {
	cd docker
	git describe --always | tr "-" "." | cut -c2-
}

package() {
	cd "$srcdir"/docker/contrib/init/openrc
	install -Dm755 docker.confd "$pkgdir"/etc/conf.d/docker
	install -Dm755 docker.initd "$pkgdir"/etc/init.d/docker
}
