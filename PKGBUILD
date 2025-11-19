# Maintainer: Mr.Makkhawan Sardlan <makkawan2553@gmail.com>
pkgname='ctdb'
pkgver='0.1.0a'
pkgrel=1
epoch=
pkgdesc="For controlling discord bots (Python script)"
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
source=("https://raw.githubusercontent.com/makk-r/CTDB/main/Program/Download/CTDB-${pkgver}.tar.gz")
noextract=()
# 💡 สำคัญ: ต้องใส่ Checksum จริงที่ได้จาก makepkg -g
sha256sums=('ad8118e4f3a2e100aa064d9d5381518180d96c467beab4f4ffb6e02dbdee8e0c') 
validpgpkeys=()

package() {
    cd "$pkgname-$pkgver"
    install -d "$pkgdir/usr/lib/$pkgname"

    cp -r usr/lib/* "$pkgdir/usr/lib/$pkgname/"

	find "$pkgdir/usr/lib/$pkgname" -type f -exec chmod 644 {} \;

	install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname"

	cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
python3 /usr/lib/$pkgname/main.py "\$@"
EOF
}
