# Maintainer: Debendra Oli <debendraoli [at] pm [dot] me>

pkgname=terraspace-bin
pkgver=1.1.7
pkgrel=1
pkgdesc="Terraspace: The Terraform Framework"
arch=('x86_64')
depends=('tar' 'binutils')
url="https://github.com/boltops-tools/terraspace"
license=('Apache-2.0 License')
source=("https://apt.boltops.com/packages/terraspace/terraspace-latest.deb" "terraspace.install")
sha256sums=('25d3e8184aee913a57e1b40e6f3f08dc7b53051f565e75f47383d84e9c6493b1' '5670c1d3bc684a4b2d2d4dd4f3a098233bc8e83b5730c9b8004a855c97c6697f')

install=terraspace.install
prepare() {
	cd "$srcdir/"
	tar -xf data.tar.xz
}

package() {
	cd "$srcdir/"
	install -d "$pkgdir/opt/terraspace"
	cp -r "$srcdir/opt/terraspace/embedded" "$pkgdir/opt/terraspace"
}
