# Maintainer: chenpi11 <chenpi11@users.noreply.github.com>
pkgname=sub-store-front-end-bin
pkgver=2.32.2
pkgrel=1
pkgdesc='Sub-Store Progressive Web App'
arch=('any')
url='https://github.com/sub-store-org/Sub-Store-Front-End'
license=('GPL-3.0-only')
depends=()
makedepends=()
provides=('sub-store-front-end')
conflicts=('sub-store-front-end' 'sub-store-front-end-git')
source=("$url/releases/download/$pkgver/dist.zip"
        "$url/raw/$pkgver/LICENSE")
sha256sums=('5caa2dbcef7506bf67753adc1665da5ac8bd847f9769c4a7472d95ab0cb92057'
            'SKIP')

package() {
    # Install web app files
    install -dm755 "$pkgdir/usr/share/sub-store-front-end"
    cp -r "$srcdir/dist"/* "$pkgdir/usr/share/sub-store-front-end/"

    # Install LICENSE
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo '==> Sub-Store Front-End has been installed!'
    echo '==> Web app files are located at: /usr/share/sub-store-front-end/'
    echo '==> You can serve these files with any web server (nginx, apache, etc.)'
    echo '==> Backend: https://github.com/sub-store-org/Sub-Store'
}
