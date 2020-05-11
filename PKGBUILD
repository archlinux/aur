# Maintainer: Leon Kowarschick <lkowarschick at gmail dot com>
pkgname=pipr-bin
pkgver=0.0.11
pkgrel=1
conflicts=('pipr-git')
makedepends=()
#depends=('gcc-libs')
depends=()
optdepends=('bubblewrap: run commands in isolation. STRONGLY RECOMMENDED!')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A commandline-utility to interactively build complex shell pipelines"
license=('MIT')
source=('pipr::https://gitlab.com/Elkowar/pipr/uploads/9a4eb309170edb8880d550187e87a8a9/pipr'
        'pipr-git::git+https://gitlab.com/Elkowar/pipr.git')
url="https://gitlab.com/Elkowar/pipr"
md5sums=('SKIP'
         'SKIP')


package() {
    cd "$srcdir"
    install -Dm 755 pipr -t "${pkgdir}/usr/bin"
    cd "$srcdir/pipr-git"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
