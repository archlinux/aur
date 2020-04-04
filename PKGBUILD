# Maintainer: Gabriel B. Sant'Anna <baiocchi.gabriel@gmail.com>

# overall information
pkgname=akku
pkgdesc="Language package manager for Scheme"
url="https://akkuscm.org/"
license=('GPL3')
arch=('any')

# version-specific information
pkgrel=1
pkgver=1.0.1

# dependencies are stated in https://gitlab.com/akkuscm/akku/-/blob/master/README.md
depends=('git' 'curl' 'guile>=2.2')
makedepends=('pkg-config' 'make')

# source URLs for latest versions can be found at https://gitlab.com/akkuscm/akku/-/releases
source=("https://gitlab.com/akkuscm/akku/uploads/7d34b733d5a6518d7842016e878ab8fc/$pkgname-$pkgver.tar.gz"
        "https://gitlab.com/akkuscm/akku/uploads/d8db897d2f28a112cc941f00711ff7a3/$pkgname-$pkgver.tar.gz.sig")
noextract=('$pkgname-$pkgver.tar.gz.sig')

# using key_id=E33E61A2E9B8C3A2, as found in https://gitlab.com/akkuscm/akku/-/blob/master/README.md
# gpg key used is in the output of gpg --list-keys --fingerprint $key_id
validpgpkeys=('08272FBB54EEB5072D5BA930E33E61A2E9B8C3A2')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# md5sums generated with updpkgsums
md5sums=('72ce46a5bc98cb0c4a549b41dd3f11b2'
         'SKIP')
