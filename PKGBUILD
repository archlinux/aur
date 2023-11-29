# Maintainer: Kimiblock Moe
pkgname=mcctl-git
pkgver=r126.8e7e645
pkgrel=1
epoch=
pkgdesc="A powerful script which can automatically operate Minecraft servers to run, update and more"
arch=('any')
url="https://github.com/Kimiblock/mcctl/"
license=('GPL3')
groups=()
depends=('bash' 'wget' 'java-environment' 'screen')
makedepends=("git")
checkdepends=()
optdepends=(
		'git: Version control'
		'python-pip: Download plugins from spigot site'
		'python: Download plugins from spigot site'
		'chromium: Download plugins from spigot site'
		'systemd: Start Minecraft on startup'
		'xdg-utils: Open EULA page automatically'
		'polkit: Elevate permissions graphically'
		'ssmtp: Send report mails'
)
provides=(mcctl)
conflicts=(mcctl)
replaces=(mcctl)
install=
source=("git+https://github.com/Kimiblock/mcctl")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
   cd mcctl
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd mcctl
    mkdir -p ${pkgdir}/usr/bin
    mv mcctl ${pkgdir}/usr/bin
    chmod +x ${pkgdir}/usr/bin/mcctl
    mkdir -p ${pkgdir}/opt/mcctl
    mv resources ${pkgdir}/opt/mcctl/
    rm ${pkgdir}/opt/mcctl/resources/demo.png
}
