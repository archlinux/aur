# Maintainer: desbma
pkgname=imgur-uploader-git
pkgver=r31.225dba7
pkgrel=1
pkgdesc="A script that uploads an image to imgur and copies the image URL to the clipboard"
arch=('any')
url="https://github.com/tangphillip/Imgur-Uploader"
license=('MIT')
depends=('curl')
optdepends=('xsel: Copy URL to clipboard'
            'xclip: Alternative to copy URL to clipboard')
conflicts=('imgur')
source=("$pkgname"::'git://github.com/tangphillip/Imgur-Uploader')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname}"
    install -Dm 755 -t "${pkgdir}/usr/bin/imgur" imgur
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
