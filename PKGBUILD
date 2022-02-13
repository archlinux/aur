# Maintainer: Mathias Buhr <napcode@aparatus.de>

pkgname=convertwithmoss
pkgver=4.7.1
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
sha256sums=('7914428705ee5e08f9b60a3f9d120ee20999e65bae9533a4180e758a14f2e019')

package() {
    tar -x --xz -f data.tar.xz -C "${pkgdir}"

    install -Dm644 $pkgdir/opt/convertwithmoss/lib/convertwithmoss-ConvertWithMoss.desktop -t $pkgdir/usr/share/applications

    rm $pkgdir/opt/convertwithmoss/lib/convertwithmoss-ConvertWithMoss.desktop
}
