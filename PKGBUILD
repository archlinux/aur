# Maintainer: Mr.Makkhawan Sardlan <makkawan2553@gmail.com>
pkgname='ctdb'
pkgver='0.2.1a'
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

sha256sums=('34beb66342f924fc11ead3c73d92b8c2b1608eac087b4600abbb17b41f1ce5e5') 
validpgpkeys=()

package() {
    cd "CTDB-$pkgver"
    install -d "$pkgdir/usr/lib/$pkgname"

    cp -r usr/lib/* "$pkgdir/usr/lib/$pkgname/"

	find "$pkgdir/usr/lib/$pkgname" -type f -exec chmod 644 {} \;

    install -d "$pkgdir/usr/share/$pkgname"

    cp -r usr/share/* "$pkgdir/usr/share/$pkgname/"

    find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} \;

	install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname"

	cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
python3 /usr/lib/$pkgname/main.py "\$@"
EOF
}
