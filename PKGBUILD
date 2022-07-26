# Maintainer: Kimiblock Zhou <pn3535@icloud.com>
pkgname=mcctl-git
pkgver=r90.efd5233
pkgrel=1
epoch=
pkgdesc="A powerful script which can automatically operate Minecraft servers to run, update and more"
arch=('any')
url="https://github.com/Kimiblock/mcctl/"
license=('GPL3')
groups=()
depends=('bash' 'wget' 'jre-openjdk-headless' 'screen')
makedepends=()
checkdepends=()
optdepends=(
		'git: for updating script'
		'python-pip: for chromedriver usage'
		'python: for chromedriver usage'
		'chromium: for chromedriver usage'
		'systemd: for autostart function'
		'xdg-utils: for opening Mojang EULA websites automatically'
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
