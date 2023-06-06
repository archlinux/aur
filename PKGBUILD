# Maintainer: Peter Gaede <peter-gaede@mail.de>

_pkgbasename=new-mail-indicator
pkgname=gnome-shell-extension-${_pkgbasename}
pkgver=44
pkgrel=4
pkgdesc="Gnome shell extension to notify new mails - only Gnome shell version 44."
arch=('any')
url="https://github.com/fthx/new-mail-indicator"
license=('GPL2')
depends=('gnome-shell>=1:44')
conflicts=('gnome-shell>=1:45')
optional=('evolution')
source=("https://github.com/fthx/new-mail-indicator/archive/refs/heads/master.zip")
sha256sums=('0f1d8181466e5815827dd41a1b5b14253e9ba9a1c5c2b653208893a09655a8fa')
_extension_dir=/usr/share/gnome-shell/extensions/${_pkgbasename}@fthx


build() {
    cd "$srcdir/${_pkgbasename}-master"
	sed -i 's/\[\"3.36\", \"3.38\", \"40\"\]/\[\"44\"\]/' metadata.json
}


package() {
		install -D -m644 "${srcdir}/${_pkgbasename}-master/extension.js" "${pkgdir}${_extension_dir}/extension.js"
		install -D -m644 "${srcdir}/${_pkgbasename}-master/metadata.json" "${pkgdir}${_extension_dir}/metadata.json"
}
