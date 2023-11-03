# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=image-optimizer
pkgname=$_pkgname-bin
pkgver=0.1.20
pkgrel=1
pkgdesc='Simple lossless image compression'
arch=('x86_64')
url='https://github.com/gijsgoudzwaard/image-optimizer'
license=('MIT')
depends=('granite' 'optipng' 'jpegoptim')
conflicts=($_pkgname)
provides=($_pkgname)
_pool_url='http://packages.elementary.io/appcenter/pool/main/c/'
_binary_name='com.github.gijsgoudzwaard.image-optimizer'
_pkg_hash='06ef81'
source=("$_pool_url/$_binary_name/$_binary_name$pkgver-$_pkg_hash.deb"
        "LICENSE$pkgver::$url/raw/$pkgver/LICENSE")
sha256sums=('e2a2b17816950d75bfa19f7a57bcf58523cd272ff6ccc10c2a288fc7fee25583'
            '6477678e949d04b38104a51115dc9f2978cb34c7c98aa56865babf8b50277c21')

package() {
# Create a folder
  mkdir -p "$pkgdir/usr/lib"
# Install
  tar -xf data.tar.xz -C "$pkgdir"
  ln -s $_binary_name "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
# Fix error
  ln -s /lib/libgranite.so "$pkgdir/usr/lib/libgranite.so.5"
# Clean up
  rm -dr "$pkgdir/usr/share/contractor" "$pkgdir/usr/share/doc/$_binary_name/copyright"
}
