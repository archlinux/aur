# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=tuxguitar-bin
_name=tuxguitar
pkgver=1.6.1
pkgrel=1
pkgdesc="TuxGuitar is an Open Source multitrack tablature editor and player written in Java."
arch=('x86_64')
url="https://github.com/helge17/tuxguitar"
license=('LGPL')
depends=('java-runtime' 'alsa-lib')
optdepends=('jack' 'fluidsynth' 'soundfont-unison')
options=('!strip')
source=("https://github.com/helge17/tuxguitar/releases/download/$pkgver/$_name-$pkgver-linux-swt-x86_64.tar.gz"
        "$pkgname.sh")
sha256sums=('364674d770d80d011f6822bf10308ef810539840b180fb0c32adec1c8fe37ea8'
            '3161e7eae2d4bc03a7108f01b8773b6101762c34876cfc948dfb441bb3836b48')

package() {
    install -d -m755 "$pkgdir/opt/$_name"
    install -D -m755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    cd "$srcdir/$_name-$pkgver-linux-swt-x86_64"
    cp -r * "$pkgdir/opt/$_name"
}
