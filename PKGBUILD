pkgname=gale-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Lightweight Thunderstore client"
arch=('x86_64')
url="https://github.com/Kesomannen/gale"
license=('GPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl-1.1' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/Kesomannen/gale/releases/download/$pkgver/gale_"$pkgver"_amd64.deb")
sha256sums_x86_64=('0ac45630ac6546ca71d9bbda49c7a858c5455e581b74e6319e8e9c0076498fd8')

package(){
    # extract package data
    tar xf data.tar.gz -C "${pkgdir}"
}

post_install() {
    gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
    update-desktop-database -q
}

post_upgrade() {
    post_install
}

post_remove() {
    gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}
