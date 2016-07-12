# Maintainer: KeyboardFire <andy@keyboardfire.com>
pkgname=xscast-git
pkgver=r14.1b22738
pkgrel=1
pkgdesc='screencasts of windows with keystrokes overlayed'
arch=('any')
url='https://github.com/KeyboardFire/xscast'
license=('MIT')
depends=('ffmpeg' 'imagemagick' 'xorg-xinput' 'xorg-xwininfo' 'dzen2')
makedepends=('git')
provides=('xscast')
source=('xscast::git+git://github.com/KeyboardFire/xscast#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -D xscast.sh $pkgdir/usr/bin/xscast
    install -Dm644 xscast.1 $pkgdir/usr/share/man/man1/xscast.1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
