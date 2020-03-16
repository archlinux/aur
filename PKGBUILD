# Maintainer: Oliver Gondža <ogondza@gmail.com>
# Contributor: Oliver Gondža <ogondza@gmail.com>
pkgname=openrc-manager
_binname=openrc
pkgver=0.1
pkgrel=1
pkgdesc="Manage OpenStack openrc files"
arch=('any')
url="https://github.com/olivergondza/openrc-manager"
license=('GPL')
groups=()
depends=('bash')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/olivergondza/openrc-manager.git#tag=${pkgver}")
noextract=()
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	# Noop
}

package() {
	cd "${srcdir}/${pkgname}"
  install -D -m 755 $_binname "${pkgdir}/usr/bin/${_binname}"
  install -D -m 644 completion/fish.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
  install -D -m 644 completion/bash.sh "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
}
