# Maintainer: Mathias Buhr <napcode@aparatus.de>

pkgname=convertwithmoss
pkgver=5.1
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
sha256sums=('bc489419c296fbe8d422ec122ddf2809e8337ad10cc5dc5e20156dde40b559d0')

package() {
    tar -x --xz -f data.tar.xz -C "${pkgdir}"

    install -Dm644 $pkgdir/opt/convertwithmoss/lib/convertwithmoss-ConvertWithMoss.desktop -t $pkgdir/usr/share/applications

    rm $pkgdir/opt/convertwithmoss/lib/convertwithmoss-ConvertWithMoss.desktop
}
