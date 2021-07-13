# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Nikola Hadžić <nikola@firemail.cc>

pkgname=reddio
pkgver=0.45
pkgrel=1
pkgdesc="A command-line interface for Reddit written in POSIX sh"
arch=('any')
url="https://gitlab.com/aaronNG/reddio"
license=('MIT')
depends=('curl' 'jq') 
optdepends=('gnu-netcat: for authentication'
            'openbsd-netcat: for authentication'
	    'bash: POSIX compliant shell'
	    'dash: POSIX compliant shell'
	    'ksh: POSIX compliant shell')
source=(https://gitlab.com/aaronNG/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
	lib_dir.patch)
sha512sums=("6e4af6d6d1cdf7059af5a2bf3e151ca99115402e9e8a0b5beacdeb6c1a6e9897feebc078a1ddb1320f356c91af4f2593fb40f8a16a219f496796fc36df0bab84"
            "ddbe50b279027ed76e8ce14516d3d8dfba79bfc306f9cbb9d782f31573e3ca14bccc03403a2dac393e2ec2798b1db17064fa618eb5b17cfd14c2aa37bb3e0ef3")

prepare() {
	cd "$pkgname-v$pkgver"
	patch --forward --strip=1 --input="$srcdir"/lib_dir.patch
}

package() {
	cd "$pkgname-v$pkgver"
	PREFIX="$pkgdir"/usr make install
}
