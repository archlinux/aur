# Maintainer: cuzrawr
# Contributors: many  

pkgname=xcursor-pixelfun-all
epoch=1
pkgver=1.0
pkgrel=1
pkgdesc="Minimalistic cursor theme with a piece of old-school"
arch=('any')
#url=""
license=('unknown')  # No license provided
makedepends=('zstd' 'tar')
# opendesktop.org-based platforms constantly change two chunks of their source
# URL. We must get both values from the same call.
#_tstamps=($(curl -s "$url" | grep -e "hash =" -e 'timetamp =' | sed "s/.*= '\\(.*\\)';/\\1/"))
#source=("$pkgname-$pkgver.tar.gz::https://dl.opendesktop.org/api/files/download/id/1505142083/s/${_tstamps[0]}/t/${_tstamps[1]}/u//168338-pixelfun3.tar.gz")
source=("xcur-pixelfun-all-merge.tar.zst")
sha256sums=('051cf53acc366b90fddfb89c7cf78677834fe640f8274f02874aa132281f96b7')
install='xcursor-pixelfun-all.install'
provides=('xcursor-pixelfun-all')
conflicts=("xcursor-pixelfun3")

package() {
    mkdir -p "$pkgdir/usr/share/icons"
    #cp -r pixelfun3 "$pkgdir/usr/share/icons/"
    tar --directory "$pkgdir/usr/share/icons/" -I zstd -xpvf xcur-pixelfun-all-merge.tar.zst
    #find "$pkgdir/usr/share/icons/pixelfun2" -type f -exec chmod 644 {} +
    #find "$pkgdir/usr/share/icons/pixelfun2" -type d -exec chmod 755 {} +
}
