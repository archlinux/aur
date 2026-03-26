# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiori-ebook-bin
pkgver=0.2.6
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
source=("Shiori_0.2.6_linux_amd64.tar.gz::${url}/releases/download/v${pkgver}/Shiori_0.2.6_linux_amd64.tar.gz")
sha256sums=('bc12436ec728816f5495d3f28915a8cadc26a616da4cd016be2395083fcc0377')

package() {
    # Extract release payload
    bsdtar -xpf "Shiori_${pkgver}_linux_amd64.tar.gz" -C "${pkgdir}"

    # Fix permissions
    chmod -R u+rwX,go+rX,go-w "${pkgdir}"
}
