# Maintainer: lskfd4f noreply@example.com

pkgname=deepl-electron-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Electron wrapper for DeepL Translator (binaries)"
arch=(any)
url="https://github.com/oifj34f34f/deepl-electron-bin"
license=("MIT")
source=("https://github.com/oifj34f34f/deepl-electron-bin/raw/main/deepl-electron.tar.xz")
sha512sums=("6f512952cb2397d3ace29dc6e9a02dc9db050d8946294b3d9200c973115df5fe95b9f2041cffc90cf0b7f97e3d8147cffbd38771ee3dcd0ff3751d612b56f69f")

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/deepl-electron" "${pkgdir}/opt/deepl-electron"
    _symlink deepl-electron
}

_symlink() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/deepl-electron/electron-deepl-translator" "$pkgdir/usr/bin/${1##*/}"
    chmod 755 "$pkgdir/opt/deepl-electron"
}
