# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=grinder
pkgver=3.11
pkgrel=1
pkgdesc="The Grinder"
arch=('any')
url="http://grinder.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/project/grinder/The%20Grinder%203/${pkgver}/${pkgname}-${pkgver}-binary.zip")
md5sums=('e4f905d8f7e8f4a1352ef024a867226c')
install=grinder.install

package() {
  install -dm755 "$pkgdir"/opt "$pkgdir"/etc/profile.d

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir"/opt/grinder

  # generate a profile script to pull in the CLASSPATH
  cat > "$pkgdir"/etc/profile.d/grinder.sh <<'EOF'
CLASSPATH="$CLASSPATH:/opt/grinder/lib/grinder.jar"
export CLASSPATH
EOF
}
