# Maintainer: 
pkgname=localdns-git
pkgver=0.3.0
pkgrel=2
pkgdesc="With this package the user is able to define a wrapper around DNS resolution with which one can define some fake dns adresses that will be mapped to a specific device on a local network identified by a mac address."
arch=(x86_64)
url="https://gitlab.com/ia-projekt-zespolowy-2021-2022/local-dns"
license=('GPL')
depends=('python>=3' 'python-dnslib' 'python-hosts>=1.0' 'libcrafter-git')
makedepends=('git' 'make' 'gcc>=10' 'autoconf')
source=("git+$url#branch=main")
md5sums=('SKIP')


build() {
	cd "local-dns"
	make get_ip	 
}

package() {
	cd "local-dns"
	make DESTDIR="$pkgdir" install
}
