# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=sah_components_config-git
pkgver=r6.0c36c33
pkgrel=1
pkgdesc='A small python script that helps with generating config options for sah tools'
url='https://gitlab.com/mvg_sah/sah_components_config.git'
arch=('any')
license=('WTFPL')

depends=(
	'python3'
)

makedepends=(
)

conflicts=(
	'sah_components_config'
	'sah_components_config-git'
)

provides=(
	'sah_components_config'
	'sah_components_config-git'
)

source=("${pkgname}::git+https://gitlab.com/mvg_sah/sah_components_config.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname}"
	install -d ${pkgdir}/usr/bin
	install -m 0755 sah_components_config ${pkgdir}/usr/bin/sah_components_config
}
