# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=superfamily
pkgver=1.75
pkgrel=1
pkgdesc=''
arch=('any')
license=('custom')
url='http://supfam.org'
depends=('hmmer')
makedepends=('bash')
provides=()
path="/SUPERFAMILY/downloads"
source=(
        "$url$path/downloads.tar.gz"
)

sha512sums=(
'2c2bad94a3855d0f529c5747fa269d9b7454f64e923085e05fadbb979a54ef72da617c4157f58971c16f1997a4c94d7b5729faec1840d8e51f81a7ba783bd1ae'
)

package() {
  mkdir -p "$pkgdir/opt/$pkgname/"
  mkdir -p "$pkgdir/usr/bin/"

  install -Dm644 license/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  ls                 | egrep -v '.+\.gz|.+\.tgz|LICENSE|archive|SUPERFAMILY|scripts' | while read -r fileName ; do
    cp -rfLH "$fileName" "$pkgdir/opt/$pkgname/"
  done

  ls license         | egrep -v '.+\.gz|.+\.tgz|LICENSE|archive|SUPERFAMILY|scripts' | while read -r fileName ; do
    cp -rfLH "license/$fileName" "$pkgdir/opt/$pkgname/"
  done

  ls license/scripts | egrep -v '.+\.gz|.+\.tgz|LICENSE|archive|SUPERFAMILY|scripts' | while read -r fileName ; do
    cp -rfLH "license/scripts/$fileName" "$pkgdir/usr/bin/"
  done

}
