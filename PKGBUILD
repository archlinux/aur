# Maintainer: Shorin <2433516202@qq.com>
pkgname=shorinclip-git
_pkgname=shorinclip   
pkgver=v1.1.0.r12.g292ea67
pkgrel=1
pkgdesc="A wayland clipboard TUI based on fzf wl-clipboard and cliphist (Git version)"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorinclip"
license=('MIT')
depends=('fzf' 'cliphist' 'wl-clipboard' 'ffmpegthumbnailer' 'chafa' 'bash')
makedepends=('git')   
provides=("$_pkgname") 
conflicts=("$_pkgname") 

source=("git+https://github.com/SHORiN-KiWATA/shorinclip.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 shorinclip "$pkgdir/usr/bin/$_pkgname"
}
