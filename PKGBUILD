# Maintainer: desbma
pkgname=imgur-uploader-git
pkgver=r31.225dba7
pkgrel=2
pkgdesc="A script that uploads an image to imgur and copies the image URL to the clipboard"
arch=('any')
_gitname='Imgur-Uploader'
url="https://github.com/tangphillip/${_gitname}"
license=('MIT')
depends=('curl')
optdepends=('xsel: Copy URL to clipboard'
            'xclip: Alternative to copy URL to clipboard')
conflicts=('imgur')
source=("git://github.com/tangphillip/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_gitname}"
    install -Dm 755 -t "${pkgdir}/usr/bin" imgur
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
