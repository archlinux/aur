# Maintainer: <mmoya at mmoya dot org>
pkgname=furtherance-bin
pkgver=25.3.0
pkgrel=1
pkgdesc="Track your time without being tracked"
arch=('x86_64')
url="https://github.com/unobserved-io/Furtherance"
license=('GPL-3.0')
source=("https://github.com/unobserved-io/Furtherance/releases/download/${pkgver}/furtherance-${pkgver}-amd64.deb")
options=('!debug')
sha256sums=("120d698fcc751ff7cec907f8d11bfa3db2bebf00376d3ede6c708724272a1b24")

package() {
    ar x "furtherance-${pkgver}-amd64.deb"
    tar -xvz -C "$pkgdir" -f data.tar.gz

    # Fix icon dir names
    (
        cd "$pkgdir/usr/share/icons/hicolor"
        for res in 32 64 256 512 1024; do
            mv -v "${res}x${res}@2x" "${res}x${res}@2"
        done
    )
}
