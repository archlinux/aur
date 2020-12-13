# Maintainer: Luke Frisken <l.frisken@gmail.com>
pkgname=aleo-studio-bin
pkgver=0.11.0
pkgrel=2
license=('custom')
pkgdesc="The World's First IDE for Zero-Knowledge Proofs."
arch=('x86_64')
url=https://aleo.studio/
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libappindicator-gtk3 libsecret)
source=("https://aleo-studio-releases.sfo2.digitaloceanspaces.com/latest/aleo-studio_latest_amd64.deb")
md5sums=('2759d003773cee87b70fa85385a50607')

# extract the exact package version from the control.tar.gz file
pkgver() {
	pushd "${srcdir}" > /dev/null
	mkdir -p control
	tar -xf control.tar.gz -C control
	grep -Po "Version: \K.*" control/control
	popd > /dev/null
}

package() {
	tar -xf data.tar.xz -C "${pkgdir}"
	chown root:root -R ../pkg/aleo-studio-bin/opt
	chmod 755 -R ../pkg/aleo-studio-bin/opt
	chown root:root -R ../pkg/aleo-studio-bin/usr
	chmod 755 -R ../pkg/aleo-studio-bin/usr
}