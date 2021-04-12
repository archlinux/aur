# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=wonderpen-bin
pkgver=1.8.5
_pkgver=5546
pkgrel=1
pkgdesc='A professional writing software with markdown support'
arch=('x86_64')
url='https://www.atominn.com/wonderpen'
license=('custom')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
provides=('wonderpen')

source=("https://file.atom.oldj.net/WonderPen/beta/WonderPen_linux_${pkgver}(${_pkgver}).deb")
sha256sums=('ef246056da5f9f71baedc6e99b9ac1303b29c7147a53ecbed8474094f3ecbfff')

package() {
    # Install 
    cd "$srcdir"
    tar -xJf data.tar.xz -C "$pkgdir"
    install -dm755 "$pkgdir"/usr/bin
    ln -s /opt/WonderPen/wonderpen "$pkgdir"/usr/bin/wonderpen
    sed -i 's|^Exec=/opt/WonderPen/wonderpen %U|Exec=wonderpen %F|g' "$pkgdir"/usr/share/applications/wonderpen.desktop
    (cd "$pkgdir"/usr/share/icons/hicolor && mv 0x0 1024x1024)
}
