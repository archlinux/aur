# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiori-ebook-bin
pkgver=0.2.4
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
source=("Shiori_0.2.4_amd64.deb::${url}/releases/download/v${pkgver}/Shiori_0.2.4_amd64.deb")
sha256sums=('5c24f84bfdcb296617e1d93c231a93fb32d1f92dff265dfa2f0746e4c77b3cc9')

package() {
    # Extract .deb package
    bsdtar -xf "Shiori_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"

    # Fix permissions
    chmod -R u+rwX,go+rX,go-w "${pkgdir}"
}
