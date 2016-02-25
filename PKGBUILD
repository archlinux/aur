# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=plosetup
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="helper to set up loop devices for partitions in a disk image"
arch=("any")
url="http://zwizwa.be/darcs/pool/bin/plosetup"
license=('Artistic2.0')
groups=()
depends=()
makedepends=('curl')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://zwizwa.be/darcs/pool/bin/plosetup")
noextract=("http://zwizwa.be/darcs/pool/bin/plosetup")
md5sums=("2de1300fd8cfeab9ab2de105f5144bda")
validpgpkeys=()

prepare() {
cat  <<EOF | patch --follow-symlinks plosetup
--- plosetup~	2016-02-25 22:38:43.000000000 +0100
+++ plosetup	2016-02-25 22:51:06.336526290 +0100
@@ -84,6 +84,7 @@
 
 case "\$(file -b \$IMG)" in
   (x86\\ boot\\ sector*) :;;
+  (DOS*\\ boot\\ sector*) :;;
   *)
     echo "E: \$ME: \$IMG does not have a msdos partition table"
     exit 3
EOF
    chmod +x plosetup
}

build() {
    return 0
}

check() {
    return 0
}

package() {
    install -D -o root -g root -m 755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
