# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=gdsdecomp-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Godot reverse engineering tools"
arch=(x86_64)
url=https://github.com/bruvzg/gdsdecomp
license=(MIT)
provides=('gdre_tools')
options=('!strip')
source=("https://github.com/bruvzg/gdsdecomp/releases/download/v$pkgver/GDRE_tools-v$pkgver-linux.zip"
        "https://raw.githubusercontent.com/bruvzg/gdsdecomp/refs/tags/v$pkgver/LICENSE")
sha256sums=('5573da0a9ee7cd8b3d9239603bbe0c098c9058ac00ad5bcdea1dddd69701efcf'
            '6181b7004272970cff8063ac38dffa7a673328b1eb26647770448e46e20412f4')

package() {
    install -d "${pkgdir}/usr/bin"

    install -Dm755 "gdre_tools.x86_64" "${pkgdir}/opt/${pkgname}/gdre_tools"
    install -Dm644 "gdre_tools.pck" "${pkgdir}/opt/${pkgname}/gdre_tools.pck"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/opt/${pkgname}/gdre_tools" "${pkgdir}/usr/bin/gdre_tools"
}
