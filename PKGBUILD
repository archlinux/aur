# Maintainer: Lunix (David Hess) <davidhess336@gmx.de>
pkgname='dimethoxy-plasma-bin'
pkgver=1.2.1
pkgrel=1
pkgdesc="Asymmetrical Distortion Effect for VST3 and LV2 compatible hosts"
arch=('x86_64')
url="https://github.com/Dimethoxy/Plasma"
license=('GPL3')
provides=('dimethoxy-plasma')
source=("https://github.com/Dimethoxy/Plasma/releases/download/v$pkgver/plasma-v$pkgver-linux.tar.gz")
sha256sums=('f61cfd287b0d58b9eca419c6c785e66a8bf94caf26b33615aa465c25bd8ee4e1')

package() {
    # Define new directories
    install -d "$pkgdir/usr/lib/vst3/Dimethoxy/Plasma" "$pkgdir/usr/lib/lv2/Dimethoxy/Plasma"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    # Install plugins (use cp -r for directories)
    cp -r "$srcdir/Plasma.vst3" "$pkgdir/usr/lib/vst3/Dimethoxy/Plasma/"
    cp -r "$srcdir/Plasma.lv2" "$pkgdir/usr/lib/lv2/Dimethoxy/Plasma/"

    # Download and install the LICENSE from the remote URL
    curl -L "https://raw.githubusercontent.com/Dimethoxy/Plasma/refs/heads/main/LICENSE" -o "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
