# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiori-ebook-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Modern offline-first eBook library manager (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/vinayydv3695/Shiori"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'librsvg'
    'sqlite'
)
provides=('shiori-ebook')
conflicts=('shiori-ebook' 'shiori-ebook-git')
source_x86_64=("${url}/releases/download/v${pkgver}/Shiori_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
    # Extract .deb package
    bsdtar -xf "Shiori_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    
    # Fix permissions
    chmod -R u+rwX,go+rX,go-w "${pkgdir}"
}
