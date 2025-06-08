# Maintainer: HeroAAX <archlinux at heroaax dot com>
pkgname=graxpert-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="gradient removal tool for astro photographing"
arch=('x86_64')
url="https://github.com/Steffenhir/GraXpert"
license=('GPL3')
depends=('python' 'python-pip')
provides=('graxpert')
conflicts=('graxpert')
options=('!strip')
source=("https://github.com/Steffenhir/GraXpert/releases/download/${pkgver}/graxpert-linux-amd64.zip")
sha256sums=('0a7364c3304ba19f12231d533c80b294054d6558d54ecd81668e4dec49092588')

package() {
    install -d "$pkgdir/opt/$pkgname"
    bsdtar -xf graxpert-linux-amd64.zip -C "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/GraXpert-linux/GraXpert" "$pkgdir/usr/bin/$pkgname"
}
