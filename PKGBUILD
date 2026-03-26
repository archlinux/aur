# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiori-ebook-bin
pkgver=0.2.3
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
source=("Shiori_0.2.3_amd64.deb::${url}/releases/download/v${pkgver}/Shiori_0.2.3_amd64.deb")
sha256sums=('357f3fb7ea4845cbe79e3f9d2b727a8ddc0b021ea5b7851f1aca859700b4d652')

package() {
    # Extract .deb package
    bsdtar -xf "Shiori_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"

    # Fix permissions
    chmod -R u+rwX,go+rX,go-w "${pkgdir}"
}
