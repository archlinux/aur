# Maintainer: Bazizi Walid <walidbaz@users.noreply.github.com>
pkgname=bac-countdown
pkgver=1.2
pkgrel=1
pkgdesc="Live BAC exam countdown script"
arch=('any')
url="https://github.com/walidbaz/bac-countdown"
license=('MIT')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-rich')

# Use the GitHub v1.2 tag
source=("$pkgname-$pkgver.tar.gz::https://github.com/walidbaz/bac-countdown/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5baf8f0976e8f31e60b5b27146378a3409e2993338c1fa4d10bbdce4e36b3ea')

package() {
    mkdir -p "$pkgdir/usr/bin"

    # Automatically detect the extracted folder
    extracted_folder=$(find "$srcdir" -mindepth 1 -maxdepth 1 -type d)
    cd "$extracted_folder"

    # Install the main Python file
    install -Dm755 bac_date.py "$pkgdir/usr/bin/bac-countdown"
}
