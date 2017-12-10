# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=sucks
pkgver=0.8.1
pkgrel=1
pkgdesc="Simple command-line script for the Ecovacs series of robot vacuums"
arch=(any)
url="https://github.com/wpietri/sucks"
license=('GPL')
depends=('python' 'python-sleekxmpp' 'python-click' 'python-requests' 'python-pycryptodome' 'python-pycountry-convert')
checkdepends=('python-nose' 'python-requests-mock')
backup=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('45b64b65a9fe012cb8f59757ce6ae5e94822f4621c0f165e0782007d8fc8be6974d3aa6a5f5feee0cf8dbb2ca08a5e79315ae933791004fa90ce5bd228c797b7')

check() {
	cd "$pkgname-$pkgver"
	nosetests
}

package() {
	install -Dm755 $pkgname-$pkgver/sucks.py $pkgdir/usr/bin/sucks
	sed -i '1i #!/usr/bin/python' $pkgdir/usr/bin/sucks
}
