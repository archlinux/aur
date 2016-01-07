# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10
pkgver=0.8.4
pkgrel=2
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard')
changelog=(${pkgname}.changelog)
source=("https://github.com/Elbullazul/Windows-10/releases/download/v0.8.4/Windows.10.Light.v0.8.4.zip"
		"https://github.com/Elbullazul/Windows-10/releases/download/v0.8.4/tint2rc")
sha1sums=('bfbe1cd97f7ced62283d6e259c1f9c2892b25368'
			'039e19b79d169cee6617936879b8ee638b8bebf7')

package() {
  	cd Windows\ 10\ Light

  	# create theme dir
  	install -d -m 755 "$pkgdir/usr/share/themes/Windows10"

  	# install theme
  	find . -type f -exec \
    	install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10/{}" \;

	if [echo $(pacman -Q openbox | sed 's/ .*//') == "openbox"]; then
		install -d -m 644 'tint2rc'  "~/.config/tint2";
	fi
}

