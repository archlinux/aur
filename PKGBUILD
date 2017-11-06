# Maintainer: Brett Gilio <mail@brettgilio.com>
pkgname=neuron
pkgver=7.5
pkgrel=2
pkgdesc="A flexible and powerful simulator of neurons and networks NEURON is a simulation environment for developing and exercising models of neurons and networks of neurons."
arch=('x86_64')
url="https://neuron.yale.edu/neuron/"
license=('GPL')
groups=('')
depends=('aarch64-linux-gnu-gcc>=5.2' 'ncurses5-compat-libs' 'libx11' 'openmpi' 'python' 'python-numpy' 'python-scipy')
options=('!strip' '!emptydirs')
source_x86_64=("http://neuron.yale.edu/ftp/neuron/versions/v7.5/nrn-7.5.x86_64.deb")
sha512sums_x86_64=('a4ad3e5b8a3ad7e480476232b32155b03c9dd313c22480690a96da3bd039b8d106f41e1907cbe4acdf153af297b98a195204bb5e8df46b5f911dde7fda08f131')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	install -D -m644 "/usr/share/doc/neuron/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin

	mv usr/local/* usr; rm -rf usr/local

	cd ..

}
