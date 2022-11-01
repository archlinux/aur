# Maintainer: Mathias Buhr <napcode@aparatus.de>

pkgname=convertwithmoss
pkgver=5.2
pkgrel=1
pkgdesc='Converts multisamples in a specific source format to a different destination format'
arch=('x86_64')
url='http://mossgrabers.de/Software/ConvertWithMoss/ConvertWithMoss.html'
license=('LGPL3')
groups=('pro-audio')
depends=(
  'java-runtime'
)

source=("http://mossgrabers.de/Software/ConvertWithMoss/convertwithmoss_${pkgver}-1_amd64.deb")
sha256sums=('40c563e7700bb8734c34f99c9ce5b53afd17cae1ed3a98c3f8b77e8d34e6e4a5')

package() {
    tar -x --xz -f data.tar.xz -C "${pkgdir}"

    install -Dm644 $pkgdir/opt/convertwithmoss/lib/convertwithmoss-ConvertWithMoss.desktop -t $pkgdir/usr/share/applications

    rm $pkgdir/opt/convertwithmoss/lib/convertwithmoss-ConvertWithMoss.desktop
}
