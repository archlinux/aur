# Maintainer: Krzysztof Demir Kuzniak <krzysztofdemirkuzniak@gmail.com>
pkgname=flox-bin
pkgver=1.11.2
pkgrel=1
pkgdesc="Flox installer Developer environments you can take with you. It provides access to the largest, freshest collection of Open Source packages anywhere. For developers, flox makes it easy to build your own and share your own packages across your machines or team. Packages built with flox build remotely, work on any machine with flox, and automatically stay fresh.."
arch=('x86_64' 'aarch64')
url="http://flox.dev"
license=('custom:flox')
groups=('dev')
depends=('sudo')
provides=('nix')
backup=('etc/apt/sources.list.d/flox.list' 'etc/flox.toml' 'etc/flox-version' 'etc/init.d/nix-daemon' 'etc/nix/flox.conf')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://flox.dev/downloads/debian-archive/flox.x86_64-linux.deb")
source_aarch64=("https://flox.dev/downloads/debian-archive/flox.aarch64-linux.deb")
sha512sums_x86_64=('27db524e0afaa6ecbec3cef5ed5c71d8eb21a395391758c66f8d999486419e02fcbff19e812b167629317f7edb8b5870f7b2f3fdfa5ed156c2377cc59e89a950')
sha512sums_aarch64=('SKIP')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/sbin/* usr/bin; rm -rf usr/sbin

	cd ..

}
