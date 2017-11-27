# Maintainer: Samuel FORESTIER <archey@samuel.domains>

############# How to package latest release ? #############
## $ git clone https://github.com/HorlogeSkynet/archey4.git
## $ cd archey4/
## $ updpkgsums
## $ makepkg
###########################################################

pkgname=archey4
pkgver=v4.2.2
pkgrel=2
pkgdesc="Maintained fork of the original Archey Linux system tool"
arch=('any')
url="https://git.io/archey4"
license=('GPL')
depends=('python3' 'lsb-release')
optdepends=('dnsutils: `WAN_IP` will be detected 5x faster'
			'wmctrl: [graphical env.] `WindowManager` will be more accurate'
			'virt-what: [virtual env.] `Model` will contain details about the hypervisor')
provides=('archey' 'archey4')
conflicts=('archey' 'archey-git' 'archey-plus' 'archey2' 'archey3-git' 'pyarchey')
source=("https://github.com/HorlogeSkynet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=()
sha1sums=()

package() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	install -D -m755 archey ${pkgdir}/usr/bin/${pkgname}
	ln -s /usr/bin/${pkgname} ${pkgdir}/usr/bin/archey

	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
