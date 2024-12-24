# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=tuxguitar-bin
_name=tuxguitar
pkgver=1.6.5
pkgrel=1
pkgdesc="TuxGuitar is an Open Source multitrack tablature editor and player written in Java."
arch=('x86_64')
url="https://github.com/helge17/tuxguitar"
license=('LGPL')
depends=('java-runtime' 'alsa-lib')
optdepends=('jack' 'fluidsynth' 'soundfont-unison')
options=('!strip')
source=("https://github.com/helge17/tuxguitar/releases/download/$pkgver/$_name-$pkgver-linux-swt-amd64.tar.gz"
        "$pkgname.sh")
sha256sums=('c3188ba8d736d3f011399656821cdbad4cff54afbe7c420ac8fe62a689b2d4fa'
            '3161e7eae2d4bc03a7108f01b8773b6101762c34876cfc948dfb441bb3836b48')

package() {
    install -d -m755 "$pkgdir/opt/$_name"
    install -D -m755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    cd "$srcdir/$_name-$pkgver-linux-swt-amd64"
    cp -r * "$pkgdir/opt/$_name"
}
