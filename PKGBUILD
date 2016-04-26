# Maintainer: Rasmus Steinke <rasi at xssn dot at>
# Contributor: Christian Rebischke

pkgname=teiler-git
_pkgname=teiler
pkgver=315.9834654
pkgrel=1
conflicts=('teiler')
provides=('teiler')
pkgdesc="a simple screenshot/screencast tool written in bash"
arch=('any')
url='https://github.com/carnager/teiler'
license=('GPL')
depends=('ffmpeg' 'maim' 'slop' 'xclip' 'xininfo-git' 'rofi' 'diffutils')
optdepends=('fb-client:         Upload to paste.xinu.at (or selfhosted filebin)'
            'openssh:           Upload to SSH server'
            'copyq:             Copy Images to Clipboard'
            'imgurbash2:             Upload images to imgur.com'
            'libnotify:         Notifications')

options=(!strip)
install="teiler.install"
makedepends=('git')
source=('git+https://git.53280.de/teiler')

pkgver() {
    cd teiler
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${_pkgname}
    make DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       install
}
md5sums=('SKIP')
