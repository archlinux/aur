# Maintainer: Noeljnuior <liamgliamgmailcom>

pkgname=imitation-gedit-plugin-git
pkgver=8.bac57a0
pkgrel=1
pkgdesc="A gedit plugin that allows the user to edit a document in multiple places."
arch=('any')
url="https://github.com/code-tree/imitation"
license=('GPL')
depends=('gedit' 'gsettings-desktop-schemas')
makedepends=('git')
install='imitation-gedit-plugin-git.install'
source=("$pkgname::git+https://github.com/code-tree/imitation")
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname

    install -D -m 755 "org.gnome.gedit.plugins.imitation.gschema.xml" "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.gedit.plugins.imitation.gschema.xml"

    install -D -m 755 "imitation.plugin" "${pkgdir}/usr/lib/gedit/plugins/imitation.plugin"    
    install -D -m 755 "imitation/__init__.py" "${pkgdir}/usr/lib/gedit/plugins/imitation/__init__.py"
    install -D -m 755 "imitation/config.py" "${pkgdir}/usr/lib/gedit/plugins/imitation/config.py"
    install -D -m 755 "imitation/iter.py" "${pkgdir}/usr/lib/gedit/plugins/imitation/iter.py"
    install -D -m 755 "imitation/tab.py" "${pkgdir}/usr/lib/gedit/plugins/imitation/tab.py"
}

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
