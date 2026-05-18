# Maintainer: Charles "Bert" Jerred <charlesherbertjerred@gmail.com>

pkgname=treebloom-projector-bin
_pkgname=projector
pkgver=3.1.1
pkgrel=1
pkgdesc="A modular, interactive process mapping and presentation tool"
arch=('x86_64')
url="https://treebloom.org/apps/projector/"
license=('custom:Proprietary')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'gdk-pixbuf2' 'glib2' 'pango' 'libsoup3' 'openssl')

source=("${pkgname}-${pkgver}.deb::https://github.com/bertjerred/treebloom-site/releases/download/v${pkgver}/Projector_${pkgver}_amd64.deb")

# Run `updpkgsums` to replace this SKIP
sha256sums=('SKIP')

package() {
    msg2 "Extracting data payload..."
    bsdtar -xf data.tar.* -C "${pkgdir}"

    msg2 "Generating Proprietary License..."
    # 1. Create the Arch-mandated license folder
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

    # 2. Write your copyright directly into the LICENSE file
    cat <<EOF > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
Copyright (c) 2026 Charles "Bert" Jerred. All rights reserved.

This software and associated documentation files (the "Software") are proprietary. 
You may not use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
copies of the Software without explicit written permission from the author.
EOF
}
