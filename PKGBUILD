# Contributor: Bet4 <0xbet4@gmail.com>
# Maintainer: Bet4 <0xbet4@gmail.com>

_pkgname=uber-apk-signer
pkgname=$_pkgname-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='A cli tool that helps signing and zip aligning APKs with certificates.'
arch=('any')
url='https://github.com/patrickfav/uber-apk-signer'
license=('Apache')
depends=('java-runtime')
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  "$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.jar"
  $_pkgname
)
sha256sums=('8ef1d44cc787e6bdf18774c926ff87f74850d55ba5810bdc5d63555046c93eff'
            '44581b4d134c1eb8d5f77b8c1da6930baa86a494d11c3b15af272653ced5e2fd')

package() {
  cd "$srcdir"
  install -Dm644 "$_pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

