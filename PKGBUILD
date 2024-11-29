# Maintainer: Lunix (David Hess) <davidhess336@gmx.de>
pkgname='dimethoxy-plasma-bin'
pkgver=1.1.0
pkgrel=1
pkgdesc="Asymmetrical Distortion Effect for VST3 and LV2 compatible hosts"
arch=('x86_64')
url="https://github.com/Dimethoxy/Plasma"
license=('GPL3')
provides=('dimethoxy-plasma')
source=("https://github.com/Dimethoxy/Plasma/releases/download/v$pkgver/plasma-v$pkgver-linux.tar.gz")
sha256sums=('df65fa6618e48b4daaab76e55a5ced28a598ca183f8d1f716b408a7822727b2f')

package() {
    # Define directories
    install -d "$pkgdir/usr/lib/vst3" "$pkgdir/usr/lib/lv2"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    # Install plugins (use cp -r for directories)
    cp -r "$srcdir/Plasma.vst3" "$pkgdir/usr/lib/vst3/"
    cp -r "$srcdir/Plasma.lv2" "$pkgdir/usr/lib/lv2/"

    # Download and install the LICENSE from the remote URL
    curl -L "https://raw.githubusercontent.com/Dimethoxy/Plasma/refs/heads/main/LICENSE" -o "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

