# Maintainer: Debendra Oli <debendraoli [at] pm [dot] me>

pkgname=terraspace-bin
pkgver=1.1.7
pkgrel=1
pkgdesc="Terraspace: The Terraform Framework"
arch=('x86_64')
makedepends=('tar' 'binutils')
url="https://github.com/boltops-tools/terraspace"
license=('Apache-2.0 License')
source=("https://apt.boltops.com/packages/terraspace/terraspace-latest.deb" "terraspace.install")
sha256sums=('25d3e8184aee913a57e1b40e6f3f08dc7b53051f565e75f47383d84e9c6493b1' '7c44dda7bd327a3f94d42272e76006fb4dd69c573d6bcfb6072ff134fd5bbbb4')

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
