# Maintainer: Mr.Makkhawan Sardlan <makkawan2553@gmail.com>
pkgname='ctdb'
pkgver='0.1.3a'
pkgrel=1
epoch=
pkgdesc="For controlling discord bots"
arch=('any')
url="https://github.com/makk-r/CTDB"
license=('GPL')
groups=()
depends=('python3' 'python-requests' 'python-dotenv')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://raw.githubusercontent.com/makk-r/CTDB/main/Program/Download/${pkgname}-${pkgver}.tar.gz")
noextract=()

sha256sums=('1adaead9d9c092c4baa87cdbc100f13ffaf2c545f947a7a97fb1f85710db1303') 
validpgpkeys=()

package() {
    cd "CTDB-$pkgver"
    install -d "$pkgdir/usr/lib/$pkgname"

    cp -r usr/lib/* "$pkgdir/usr/lib/$pkgname/"

	find "$pkgdir/usr/lib/$pkgname" -type f -exec chmod 644 {} \;

	install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname"

	cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
python3 /usr/lib/$pkgname/main.py "\$@"
EOF
}