# Maintainer: Wael Nasreddine <wael.nasreddine@gmail.com>
pkgname=kovhernetes-git
_pkgname=kOVHernetes
pkgver=0.0.1.dev0
pkgrel=1
pkgdesc="kOVHernetes (kovh) is a command-line utility for managing Kubernetes clusters on the OVH Cloud platform."
arch=('any')
url="https://github.com/antoineco/kOVHernetes"
license=('Apache')
depends=('python-ovh' 'python-cryptography' 'python-docopt' 'python-pyopenssl')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('git+https://github.com/antoineco/kOVHernetes.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
	python setup.py install --root="$pkgdir/" --optimize=1
}
