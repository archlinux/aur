# Maintainer: lskfd4f noreply@example.com

pkgname=deepl-electron-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Electron wrapper for DeepL Translator (binaries)"
arch=(any)
url="https://github.com/oifj34f34f/deepl-electron-bin"
license=("MIT")
source=(
    "https://github.com/oifj34f34f/deepl-electron-bin/raw/main/deepl-electron.tar.xz"
    "deepl-electron.desktop"
    "deepl-electron.svg"
)
sha512sums=(
    "6f512952cb2397d3ace29dc6e9a02dc9db050d8946294b3d9200c973115df5fe95b9f2041cffc90cf0b7f97e3d8147cffbd38771ee3dcd0ff3751d612b56f69f"
    "e2ede41e9d5f80a179324c0285bcde5555adce61daf16bdd800132664a5591a7de1d6b522aa315aac3c2ab26e254b09f100a2e281bba4f8d9b3c67833465d27f"
    "216020d3f7325e717113ac85729cbbf99286c26124b2f7e422271867870a96eeb35548b91a1aee89cd8ff1102c526fe8fb1842ef408b18801673d17d418b8595"
)

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/deepl-electron" "${pkgdir}/opt/deepl-electron"
    install -Dm644 "${srcdir}/deepl-electron.desktop" "${pkgdir}/usr/share/applications/deepl-electron.desktop"
    install -Dm644 "${srcdir}/deepl-electron.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deepl-electron.svg"
    _symlink deepl-electron
}

_symlink() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/deepl-electron/electron-deepl-translator" "$pkgdir/usr/bin/${1##*/}"
    chmod 755 "$pkgdir/opt/deepl-electron"
}
