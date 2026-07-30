# Maintainer: Arunachalam <arunachalam@archlinux>
pkgname=luna-gpt
pkgver=1.0.0
pkgrel=1
pkgdesc="Arunachalam's An advanced cybersecurity chatbot and intelligent desktop assistant for Arch Linux. Developed by a 7-year veteran builder based in (Tamil Nadu), India."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/Luna-gpt"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'git')
source=("git+https://github.com/Arunachalam-gojosaturo/Luna-gpt.git")
sha256sums=('SKIP')

package() {
    mkdir -p "${pkgdir}/opt/luna-gpt"
    cp -r "${srcdir}/Luna-gpt/"* "${pkgdir}/opt/luna-gpt/"
    
    mkdir -p "${pkgdir}/usr/bin"
    echo '#!/bin/sh' > "${pkgdir}/usr/bin/luna-gpt"
    echo 'cd /opt/luna-gpt && npm start' >> "${pkgdir}/usr/bin/luna-gpt"
    chmod +x "${pkgdir}/usr/bin/luna-gpt"
}
